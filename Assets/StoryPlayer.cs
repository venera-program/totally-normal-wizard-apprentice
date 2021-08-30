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
        var title = CreateTextBox("COOL TITLE");
        title.horizontalAlignment = HorizontalAlignmentOptions.Center;
        title.fontSize = 36;
        title.fontStyle = FontStyles.Bold;
        var subtitle = CreateTextBox("Totally epic subtitle");
        subtitle.horizontalAlignment = HorizontalAlignmentOptions.Center;
        subtitle.fontSize = 24;
        subtitle.fontStyle = FontStyles.Bold | FontStyles.Italic;
        CreateTextBox("\n\n\n");

        var startButton = CreateButton("Start Game");
        startButton.onClick.AddListener(() => {
            ClearContent();
            StartCoroutine(PlayStory());
        });
    }

    private string _currentKnotName;
    private string _nextKnotName;
    private List<object> _argsForNext = new List<object>();
    private System.Collections.IEnumerator PlayStory() {
        yield return null;

        ReadLineEvent onLineRead = null;
        List<Button> liveButtons = new List<Button>();

        _nextKnotName = "intro";

        while (true) {
            if (_nextKnotName != _currentKnotName) {
                if (_nextKnotName == Rooms.Hub) {
                    ClearContent();
                } else {
                    ClearButtons(liveButtons);
                }
                ReadNextSection(onLineRead);
                liveButtons = DisplayChoices();

                yield return null;

                if (_currentKnotName == Rooms.Hub) {
                    _scrollRect.verticalNormalizedPosition = 1;
                } else {
                    _scrollRect.verticalNormalizedPosition = 0;
                }
            }
            yield return null;
        }
    }

    private void ReadNextSection(ReadLineEvent OnLineRead) {
        _story.ChoosePathString(_nextKnotName, _nextKnotName != _currentKnotName, _argsForNext.ToArray());
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
                for (int j = 0; j < buttonTags.Count; j++) {
                    Debug.LogFormat("Processing tags for button '{0}'", buttonText);
                    ProcessTags(out moveTarget, buttonTags);
                }

                button.onClick.AddListener(() => {
                    if (moveTarget != "") {
                        Debug.LogFormat("Attempting to move to {0}", moveTarget);
                        _nextKnotName = moveTarget;
                    }
                    _story.ChooseChoiceIndex(choice.index);
                    CreateTextBox(buttonText).fontStyle = FontStyles.Bold;
                });
                ret.Add(button);
            }
            return ret;
        }

        Debug.LogWarning("No choices found, ran out of logic!");
        return null;
    }

    private void ProcessTags(out string moveTarget, List<string> tags) {
        moveTarget = "";

        string tagKey;
        string tagValue;
        for (int i = 0; i < tags.Count; i++) {
            var tagValues = tags[i].Split(new char[] { ':' });
            if (tagValues.Length != 2) {
                Debug.LogErrorFormat("Tag for [{0}] written incorrectly", tags[i]);
                continue;
            }
            tagKey = tagValues[0].Trim();
            tagValue = tagValues[1].Trim();

            switch (tagKey) {
                case InkTags.Move:
                    Debug.LogFormat("Processed Move tag towards {0}", tagValue);
                    moveTarget = tagValue;
                    break;
                case InkTags.Background:
                    Debug.LogFormat("Processed Background change to {0}", tagValue);
                    // TODO: Change background
                    return;
                case InkTags.Argument:
                    Debug.LogFormat("Processed Argument tag with value '{0}'", tagValue);
                    _argsForNext.Add(tagValue);
                    return;
                default:
                    Debug.LogWarningFormat("Tag with key [{0}] not recognized", tagKey);
                    break;
            }
        }
    }

    #region UI Utilities
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

    void ClearButtons(List<Button> buttons) {
        for (int i = 0; i < buttons.Count; i++) {
            GameObject.Destroy(buttons[i].gameObject);
        }
        buttons.Clear();
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
}