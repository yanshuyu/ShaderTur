using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class DeferredFogEffect : MonoBehaviour
{
    public Shader fogShader;
    Material fogMtl;

    private void OnRenderImage(RenderTexture src, RenderTexture dest) {
        if (!fogMtl) {
            fogMtl = new Material(fogShader);
        }
        
        Graphics.Blit(src, dest, fogMtl);
    }
}
