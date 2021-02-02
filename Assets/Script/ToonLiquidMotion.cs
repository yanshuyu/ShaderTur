using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ToonLiquidMotion : MonoBehaviour
{
    Renderer rend;
    Vector3 lastPos;
    Vector3 velocity;
    Vector3 lastRot;
    Vector3 angularVelocity;
    public float MaxWobble = 0.03f;
    public float WobbleSpeed = 1f;
    public float Recovery = 1f;
    Vector3 wobbleAmount = Vector3.zero;
    Vector3 wobbleAmountToAdd = Vector3.zero;
    float pulse;

    // Use this for initialization
    void Start()
    {
        rend = GetComponent<Renderer>();
    }

    private void Update()
    {
        // decrease wobble over time
        wobbleAmountToAdd = Vector3.Lerp(wobbleAmountToAdd, Vector3.zero, Time.deltaTime * (Recovery));

        // make a sine wave of the decreasing wobble
        pulse = 2 * Mathf.PI * WobbleSpeed;
        wobbleAmount = wobbleAmountToAdd * Mathf.Sin(pulse * Time.unscaledTime);

        // send it to the shader
        rend.sharedMaterial.SetVector("_Wobble", wobbleAmount);

        // velocity
        velocity = (lastPos - transform.position) / Time.deltaTime;
        angularVelocity = transform.rotation.eulerAngles - lastRot;


        // add clamped velocity to wobble
        wobbleAmountToAdd.x += Mathf.Clamp((velocity.x + (angularVelocity.z * 0.2f)) * MaxWobble, -MaxWobble, MaxWobble);
        wobbleAmountToAdd.y += Mathf.Clamp((velocity.y + (angularVelocity.y * 0.2f)) * MaxWobble, -MaxWobble, MaxWobble);
        wobbleAmountToAdd.z += Mathf.Clamp((velocity.z + (angularVelocity.x * 0.2f)) * MaxWobble, -MaxWobble, MaxWobble);

        // keep last position
        lastPos = transform.position;
        lastRot = transform.rotation.eulerAngles;
    }



}
