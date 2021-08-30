using Ink.Runtime;
using TMPro;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StoryPlayer : MonoBehaviour {
    public delegate void ReadLineEvent(string text);

    [SerializeField]
    private TextAsset _inkJSONAsset = null;

    [Header("UI")]
    [SerializeField]
    private RectTransform _dialogueContent;
    [SerializeField]
    private ScrollRect _scrollRect;
    [SerializeField]
    private Image _currentBackground;

    [Header("Prefabs")]
    [SerializeField]
    private TMP_Text _prefabTextBox;
    [SerializeField]
    private Button _prefabButton;


    private Story _story;

    private void Awake() {
        _story = new Story(_inkJSONAsset.text);
        _story.onError += (msg, type) => {
            if (type == Ink.ErrorType.Warning)
                Debug.LogWarning(msg);
            else
                Debug.LogError(msg);
        };
    }

    private void Start() {
        ClearContent();

        CreateTextBox("\n\n\n");
        var title = CreateTextBox("TOTALLY NORMAL WIZARD APPRENTICE");
        title.horizontalAlignment = HorizontalAlignmentOptions.Center;
        title.fontSize = 36;
        title.fontStyle = FontStyles.Bold;
        // var subtitle = CreateTextBox("Totally epic subtitle");
        // subtitle.horizontalAlignment = HorizontalAlignmentOptions.Center;
        // subtitle.fontSize = 24;
        // subtitle.fontStyle = FontStyles.Bold | FontStyles.Italic;
        CreateTextBox("\n\n\n");

        ChangeBackground("titlecard");

        StartCoroutine(PlayStory());
    }

    private string _currentKnotName;
    private string _nextKnotName;
    private bool _sameNameOverride = false;
    private List<object> _argsForNext = new List<object>();
    private bool _gameOver = false;
    private bool _inIntro = true;
    private List<Button> _liveButtons = new List<Button>();

    private System.Collections.IEnumerator PlayStory() {
        ReadLineEvent onLineRead = null;
        onLineRead += (_) => {
            ProcessTags(out _, _story.currentTags);
        };

        _liveButtons.AddRange(IntroButtons());
        while (_inIntro) {
            yield return null;
        }

        ClearContent();
        _nextKnotName = "intro";

        while (!_gameOver) {
            if (_nextKnotName != _currentKnotName || _sameNameOverride) {
                _sameNameOverride = false;
                if (_nextKnotName == Rooms.Hub || _nextKnotName == "credits") {
                    ClearContent();
                } else {
                    ClearButtons();
                }
                ReadNextSection(onLineRead);
                _liveButtons = DisplayChoices();

                yield return null;

                if (_currentKnotName == Rooms.Hub || _currentKnotName == "credits") {
                    _scrollRect.verticalNormalizedPosition = 1;
                } else {
                    _scrollRect.verticalNormalizedPosition = 0;
                }
            }
            yield return null;
        }

        Debug.Log("STORY HAS STOPPED.");
    }

    private List<Button> IntroButtons() {
        List<Button> introButtons = new List<Button>();
        if (_currentKnotName != "cws") {
            var cwButton = CreateButton("Content Warnings");
            cwButton.onClick.AddListener(() => {
                _nextKnotName = "cws";
                ClearButtons();
                ReadNextSection(null);
                _liveButtons.AddRange(IntroButtons());
            });
            introButtons.Add(cwButton);
        }

        var startButton = CreateButton("Start Game");
        startButton.onClick.AddListener(() => {
            _inIntro = false;
        });
        introButtons.Add(startButton);

        return introButtons;
    }

    private void ReadNextSection(ReadLineEvent OnLineRead) {
        _story.ChoosePathString(_nextKnotName, true, _argsForNext.ToArray());
        _argsForNext.Clear();
        _currentKnotName = _nextKnotName;

        while (_story.canContinue) {
            string text = _story.Continue();
            text = text.Trim();

            if (OnLineRead != null) {
                OnLineRead(text);
            }

            CreateTextBox(text);
        }
    }

    private List<Button> DisplayChoices() {
        if (_story.currentChoices.Count > 0) {
            var ret = new List<Button>(_story.currentChoices.Count);
            for (int i = 0; i < _story.currentChoices.Count; i++) {
                Choice choice = _story.currentChoices[i];

                string buttonText = choice.text.Trim();
                Button button = CreateButton(buttonText);

                var choiceContent = _story.PointerAtPath(choice.targetPath).container.content;
                List<string> buttonTags = new List<string>();
                for (int j = 0; j < choiceContent.Count; j++) {
                    if (choiceContent[j] is Tag) {
                        Tag t = (Tag)choiceContent[j];
                        buttonTags.Add(t.text);
                    }
                }

                string moveTarget = "";
                Debug.LogFormat("Processing tags for button '{0}'", buttonText);
                var args = ProcessTags(out moveTarget, buttonTags);

                button.onClick.AddListener(() => {
                    if (moveTarget != "") {
                        Debug.LogFormat("Attempting to move to {0}", moveTarget);
                        _nextKnotName = moveTarget;
                        _sameNameOverride = _nextKnotName == _currentKnotName;
                    }
                    _argsForNext.AddRange(args);
                    _story.ChooseChoiceIndex(choice.index);
                    CreateTextBox(buttonText).fontStyle = FontStyles.Bold;
                });
                ret.Add(button);
            }
            return ret;
        }

        Debug.LogWarningFormat("No choices found, ran out of logic during {0}!", _currentKnotName);
        return null;
    }

    private List<object> ProcessTags(out string moveTarget, List<string> tags) {
        List<object> returnArgs = new List<object>();
        moveTarget = "";

        string tagKey;
        string tagValue;
        for (int i = 0; i < tags.Count; i++) {
            var tagValues = tags[i].Split(new char[] { ':' });
            switch (tagValues.Length) {
                case 1:
                    tagKey = tagValues[0].Trim();
                    switch (tagKey) {
                        case InkTags.End:
                            Debug.Log("Processed END tag");
                            _gameOver = true;
                            break;
                        default:
                            Debug.LogErrorFormat("Tag with key [{0}] not recognized or written incorrectly", tagKey);
                            break;
                    }
                    break;
                case 2:
                    tagKey = tagValues[0].Trim();
                    tagValue = tagValues[1].Trim();
                    switch (tagKey) {
                        case InkTags.Move:
                            Debug.LogFormat("Processed Move tag towards {0}", tagValue);
                            moveTarget = tagValue;
                            break;
                        case InkTags.Background:
                            Debug.LogFormat("Processed Background change to {0}", tagValue);
                            ChangeBackground(tagValue);
                            break;
                        case InkTags.Argument:
                            Debug.LogFormat("Processed Argument tag with value '{0}'", tagValue);
                            returnArgs.Add(tagValue);
                            break;
                        default:
                            Debug.LogErrorFormat("Tag with key [{0}] not recognized or written incorrectly", tagKey);
                            break;
                    }
                    break;
                default:
                    Debug.LogErrorFormat("Tag with content [{0}] not recognized", tags[i]);
                    continue;
            }
        }
        return returnArgs;
    }

    public static void QuitGame() {
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#elif UNITY_WEBPLAYER
        Application.OpenURL(webplayerQuitURL);
#else
        Application.Quit();
#endif
    }

    #region UI Utilities
    void ChangeBackground(string path) {
        _currentBackground.sprite = Resources.Load<Sprite>(path);
    }

    TMP_Text CreateTextBox(string text) {
        TMP_Text textBox = Instantiate(_prefabTextBox) as TMP_Text;
        textBox.transform.SetParent(_dialogueContent, false);
        textBox.text = text;
        return textBox;
    }

    Button CreateButton(string text) {
        Button button = Instantiate(_prefabButton) as Button;
        button.transform.SetParent(_dialogueContent, false);
        button.GetComponentInChildren<TMP_Text>().text = text;
        return button;
    }

    void ClearButtons() {
        for (int i = 0; i < _liveButtons.Count; i++) {
            GameObject.Destroy(_liveButtons[i].gameObject);
        }
        _liveButtons.Clear();
    }

    void ClearContent() {
        int childCount = _dialogueContent.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i) {
            GameObject.Destroy(_dialogueContent.transform.GetChild(i).gameObject);
        }
    }
    #endregion
}

public static class Rooms {
    public const string Hub = "hub";
    public const string Fireplace = "room_fireplace";
    public const string Couch = "room_couch";
    public const string Lunarium = "room_lunarium";
    public const string Rug = "room_rug";
}

public static class InkTags {
    public const string Move = "move";
    public const string Background = "bg";
    public const string Argument = "arg";
    public const string End = "end";
}