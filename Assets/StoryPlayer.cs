using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class StoryPlayer : MonoBehaviour {
    public delegate void ReadLineEvent(string text);

    [SerializeField]
    private TextAsset _inkJSONAsset = null;
    [Header("UI")]
    [SerializeField]
    private RectTransform _dialogueContent;
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
        var title = CreateTextBox("PARLOR TRICK");
        title.horizontalAlignment = HorizontalAlignmentOptions.Center;
        title.fontSize = 36;
        title.fontStyle = FontStyles.Bold;
        var subtitle = CreateTextBox("A lunar nightmare");
        subtitle.horizontalAlignment = HorizontalAlignmentOptions.Center;
        subtitle.fontSize = 24;
        subtitle.fontStyle = FontStyles.Bold | FontStyles.Italic;
        CreateTextBox("\n\n\n");

        var startButton = CreateButton("Start Game");
        startButton.onClick.AddListener(() => {
            StartCoroutine(PlayStory());
        });
    }

    private System.Collections.IEnumerator PlayStory() {
        string nextKnot = "intro";
        ReadLineEvent onLineRead = null;

        while (true) {
            ReadSection(nextKnot, onLineRead);


            // TODO: add choice check to not display last-chosen choice
            yield return null;
        }
    }

    private string lastKnotName;
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
}
