using UnityEngine;

public class Toggleable : MonoBehaviour
{
    private BoxCollider2D collision;
    private SpriteRenderer sprite;
    public bool startsToggled = false;

    public void Start()
    {
        collision = gameObject.GetComponent<BoxCollider2D>();
        sprite = gameObject.GetComponent<SpriteRenderer>();

        if (!startsToggled)
        {
            Toggle();
        }
    }

    public void Toggle()
    {
        collision.enabled = !collision.enabled;

        if (!collision.enabled)
        {
            sprite.color = new Color(1f, 1f, 1f, .2f);
        }
        else
        {
            sprite.color = new Color(1f, 1f, 1f, 1f);
        }
    }
}
