using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonBehaviour : MonoBehaviour
{
    public string[] commands;

    public void Start()
    {
        foreach (string cmd in commands)
        {
            cmd.ToLower();
        }
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.transform.CompareTag("Player"))
        {
            foreach (string cmd in commands)
            {
                collision.GetComponent<CommandHandler>().UnlockCommand(cmd);
            }

            Debug.Log("Unlocked command: " + commands[0]);
            Destroy(gameObject);
        }
    }
}
