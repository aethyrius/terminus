using System.Collections;
using NUnit.Framework;
using UnityEngine;

public class LevelHandler : MonoBehaviour
{
    public static LevelHandler Instance { get; private set; }
    public GameObject[] toggleables;

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            //DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    void Start()
    {
        toggleables = GameObject.FindGameObjectsWithTag("Toggleable");
        /*foreach (GameObject toggle in toggleables)
        {
            if (!toggle.GetComponent<Toggleable>().startsToggled)
            {
                toggle.SetActive(false);
            }
            
        }*/
    }
}
