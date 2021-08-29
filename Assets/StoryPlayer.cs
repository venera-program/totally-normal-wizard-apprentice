using Ink.Runtime;
using TMPro;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
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
    private Scrollbar _scrollbar;
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

    private string lastKnotName;

    private System.Collections.IEnumerator PlayStory() {
        string nextKnot = "intro";
        ReadLineEvent onLineRead = null;

        while (true) {
            if (nextKnot != lastKnotName) {
                ReadSection(nextKnot, onLineRead);
                DisplayChoices();
            }
            yield return null;
        }
    }

    private void ReadSection(string knotName, ReadLineEvent OnLineRead) {
        _story.ChoosePathString("intro", knotName != lastKnotName);
        lastKnotName = knotName;

        while (_story.canContinue) {
            string text = _story.Continue();
            text = text.Trim();

            if (OnLineRead != null) {
                OnLineRead(text);
            }

            CreateTextBox(text);
        }
    }

    private void DisplayChoices() {
        if (_story.currentChoices.Count > 0) {
            for (int i = 0; i < _story.currentChoices.Count; i++) {
                Choice choice = _story.currentChoices[i];
                Button button = CreateButton(choice.text.Trim());

                var buttonTags = _story.currentTags;
                for (int j = 0; j < buttonTags.Count; j++) {

                }

                button.onClick.AddListener(() => {

                    _story.ChooseChoiceIndex(choice.index);
                });
            }
        } else {
            Debug.LogWarning("Ran out of logic!");
        }
    }

    private void ProcessTags(out string moveTarget, List<string> tags) {
        moveTarget = "";

        string tagKey;
        string tagValue;
        foreach (string tag in tags) {
            var tagValues = tag.Split(new char[] { ':' });
            if (tagValues.Length != 2) {
                Debug.LogErrorFormat("tag for [{0}] written incorrectly", tag);
                continue;
            }
            tagKey = tagValues[0].Trim();
            tagValue = tagValues[1].Trim();

            switch (tagKey) {
                case InkTags.Move:
                    moveTarget = tagValue;
                    break;
                default:
                    Debug.LogWarningFormat("tag with key [{0}] not recognized", tagKey);
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

    void ClearContent() {
        int childCount = _dialogueContent.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i) {
            GameObject.Destroy(_dialogueContent.transform.GetChild(i).gameObject);
        }
    }
    #endregion
}

public static class InkTags {
    public const string Move = "move";
}