using System.Collections;
using System.Collections.Generic;
using UnityEngine.EventSystems;
using System.Runtime.CompilerServices;
using TMPro;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class CommandHandler : MonoBehaviour
{
    [SerializeField] private TMP_InputField inputTerminal;

    private Dictionary<string, System.Action> commands = new Dictionary<string, System.Action>();
    private HashSet<string> unlockedCommands = new HashSet<string>();

    void Start()
    {
        commands["toggle"] = ToggleBlocks;
        commands["tog"] = ToggleBlocks;

        commands["reset"] = Reset;
        commands["r"] = Reset;
        UnlockCommand("reset");
        UnlockCommand("r");
    }

    /*
     * Executes the typed command upon closing the terminal
     */

    public void EndEdit()
    {
        if (Input.GetKeyDown(KeyCode.Return))
        {
            string input = inputTerminal.text.ToLower();
            ExecuteCommand(input);
            inputTerminal.text = "";
        }
    }

    public void UnlockCommand(string command)
    {
        if (commands.ContainsKey(command))
        {
            unlockedCommands.Add(command);
        }
    }

    public void ExecuteCommand(string input)
    {
        if (unlockedCommands.Contains(input) && commands.TryGetValue(input, out var action))
        {
            action.Invoke();
        }
        else
        {
            Debug.Log("Unknown or locked command.");
        }
    }

    private void ToggleBlocks()
    {
        foreach (GameObject toggle in LevelHandler.Instance.toggleables)
        {
            toggle.GetComponent<Toggleable>().Toggle();
        }
    }

    private void Reset()
    {
        string currentSceneName = SceneManager.GetActiveScene().name;
        SceneManager.LoadScene(currentSceneName);
    }
}