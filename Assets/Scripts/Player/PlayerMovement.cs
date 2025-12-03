using System.Collections;
using System.Collections.Generic;
using TMPro.EditorUtilities;
using UnityEditor.Rendering;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UIElements;

public class PlayerMovement : MonoBehaviour
{

    [SerializeField] private float speed = 5f;
    [SerializeField] private float jumpForce = 6;
    [SerializeField] private float groundCheckDistance = 0.1f;
    [SerializeField] private float groundCheckOffset = 0.5f;
    [SerializeField] private float groundRadius = 0.55f;

    private Rigidbody2D rb;
    private int groundMask;
    private float direction;

    private void Awake()
    {
        rb = GetComponent<Rigidbody2D>();
        groundMask = 1 << LayerMask.NameToLayer("Ground");
    }

    private void Update()
    {
        bool isTerminalClosed = gameObject.GetComponent<TerminalManager>().isTerminalClosed;

        if (isTerminalClosed)
        {
            direction = Input.GetAxis("Horizontal");
            rb.linearVelocity = new Vector2(direction * speed, rb.linearVelocity.y);

            if (Input.GetKeyDown(KeyCode.Space) && IsGrounded())
            {
                rb.linearVelocity = new Vector2(rb.linearVelocity.x, jumpForce);
            }
        }
        else
        {
            float smoothedX = Mathf.Lerp(rb.linearVelocity.x, 0f, Time.deltaTime * 4);
            rb.linearVelocity = new Vector2(smoothedX, rb.linearVelocity.y);
        }
    }

    public bool IsGrounded()
    {
        Vector2 origin = (Vector2)transform.position + Vector2.down * groundCheckOffset;
        return Physics2D.CircleCast(origin, groundRadius, Vector2.down, groundCheckDistance, groundMask);
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;

        Vector3 origin = transform.position + Vector3.down * groundCheckOffset;
        Vector3 end = origin + Vector3.down * groundCheckDistance;

        Gizmos.DrawWireSphere(origin, groundRadius);
        Gizmos.DrawWireSphere(end, groundRadius);

        Gizmos.DrawLine(origin + Vector3.left * groundRadius, end + Vector3.left * groundRadius);
        Gizmos.DrawLine(origin + Vector3.right * groundRadius, end + Vector3.right * groundRadius);
    }
}
