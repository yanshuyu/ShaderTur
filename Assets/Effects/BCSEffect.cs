using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class BCSEffect : MonoBehaviour
{   
    public float brightness = 1;
    public float saturation = 1;
    public float contrast = 1;

    public Shader shader;
    private Material material;

    // Update is called once per frame
    void Update() {
        if ((shader && !material) || (shader && material && material.shader != shader)) {
            material = new Material(shader);
        }

        brightness = Mathf.Clamp(brightness, 0, 2);
        saturation = Mathf.Clamp(saturation, 0, 1);
        contrast = Mathf.Clamp(contrast, 0, 1);
    }

    private void OnRenderImage(RenderTexture src, RenderTexture dest) {
        material.SetFloat("_Brightness", brightness);
        material.SetFloat("_Saturation", saturation);
        material.SetFloat("_Contrast", contrast);
        Graphics.Blit(src, dest, material);
    }
}
