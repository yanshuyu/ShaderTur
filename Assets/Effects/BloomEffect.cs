using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode, ImageEffectAllowedInSceneView]
public class BloomEffect : MonoBehaviour
{
    const int MAX_ITERATION = 16;
    [SerializeField] Shader bloomShader;
    [SerializeField, Range(1,MAX_ITERATION)] int blurIteration = 2;
    [SerializeField, Range(0, 10)] float threshold = 1;
    [SerializeField, Range(0, 10)] float bloomStren = 1;
    [SerializeField] bool showDebug = false;

    RenderTexture[] tempTextures = new RenderTexture[MAX_ITERATION];
    Material bloomMat;

    private void OnRenderImage(RenderTexture src, RenderTexture dest) {
        if (!bloomMat) {
            Debug.Assert(bloomShader, "Must Assign a Bloom Shader");
            bloomMat = new Material(bloomShader);
            bloomMat.hideFlags = HideFlags.HideAndDontSave;
        }

        var w = src.width;
        var h = src.height;
        var fmt = src.format;
        RenderTexture curSrc = src;
        RenderTexture curDest = null;
        int i = 0;
        for (; i<blurIteration; i++) { //progressive downsampling
            w /= 2;
            h /= 2;
            if (w < 2 || h < 2)
                break;

            curDest = tempTextures[i] = RenderTexture.GetTemporary(w, h, 0, fmt);
            if (i == 0) {
                bloomMat.SetFloat("_Threshold", threshold);
                Graphics.Blit(curSrc, curDest, bloomMat, bloomMat.FindPass("ApplyThreshold"));
            } else {
                Graphics.Blit(curSrc, curDest, bloomMat, bloomMat.FindPass("DownSampling"));
            }
            curSrc = curDest;
        }

        for (; i > 0; i--) { // progressive upsampling
            curDest = tempTextures[i-1];
            Graphics.Blit(curSrc, curDest, bloomMat, bloomMat.FindPass("UpSampling"));
            curSrc = curDest;
        }

        bloomMat.SetFloat("_BoomStren", bloomStren);
        if (showDebug) {
            Graphics.Blit(curSrc, dest, bloomMat, bloomMat.FindPass("Debug"));
        } else {
            bloomMat.SetTexture("_SrcTex", src);
            Graphics.Blit(curSrc, dest, bloomMat, bloomMat.FindPass("Bloom"));
        }

        for (int j=0; j<MAX_ITERATION; j++) {
            if (tempTextures[j]) {
                RenderTexture.ReleaseTemporary(tempTextures[j]);
                tempTextures[j] = null;
            }
        }
    }

}
