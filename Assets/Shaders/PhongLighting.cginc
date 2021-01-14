#ifndef _PhongLihting_H
#define _PhongLihting_H

#include "UnityCG.cginc"
#include "UnityLightingCommon.cginc"
#include "AutoLight.cginc"

struct VS_IN
{
    float4 vertex : POSITION;
    float3 normal : NORMAL;
    float4 tangent : TANGENT;
    float2 uv : TEXCOORD0;
};

struct VS_OUT
{
    float4 pos : SV_POSITION;
    float3 normalW : NORMAL;
    float3 posW : TEXCOORD0;
    float4 tangentW : TEXCOORD1;
    float2 uv : TEXCOORD2;
    SHADOW_COORDS(3)
    #ifdef VERTEXLIGHT_ON
    float3 vertLightColor : TEXCOORD4;
    #endif
};


half3 PhongLighting(VS_OUT vs_out, half3 normalW, fixed3 Albedo, fixed3 Spec, half Shininess) {
    half3 L = normalize(UnityWorldSpaceLightDir(vs_out.posW));
    half3 V = normalize(UnityWorldSpaceViewDir(vs_out.posW));
    float NdotL = saturate(dot(normalW, L));
    half3 I = _LightColor0.rgb * NdotL;
    UNITY_LIGHT_ATTENUATION(atten, vs_out, vs_out.posW);
    I *= atten;
    
    half3 D = I * Albedo;

    float NdotH =  saturate(dot(normalW, normalize(L + V)));
    half3 S=  pow(NdotH, Shininess * 256) * Spec;

    return D + S;
}


float3 BoxProjection ( float3 sampleDir, float3 samplePos, float3 boxPos, float3 boxMin, float3 boxMax ) {
	float3 factors = ((sampleDir > 0 ? boxMax : boxMin) - samplePos) / sampleDir;
	float scalar = min(min(factors.x, factors.y), factors.z);
	return sampleDir * scalar + (samplePos - boxPos);
}

#endif