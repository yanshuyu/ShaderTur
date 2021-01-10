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


half3 PhongLighting(VS_OUT vs_out, sampler2D normalMap, fixed3 Albedo, fixed3 Spec, half Shininess) {
    half3 normalT = UnpackNormal(tex2D(normalMap, vs_out.uv));
    half3 biTangentW = normalize(cross(vs_out.normalW, vs_out.tangentW.xyz) * vs_out.tangentW.w * unity_WorldTransformParams.w); // if object has negative scale, flip bitangent
    half3 normal = normalize(normalT.x * vs_out.tangentW.xyz + normalT.y * biTangentW + normalT.z * vs_out.normalW);
    
    half3 L = normalize(UnityWorldSpaceLightDir(vs_out.posW));
    half3 V = normalize(UnityWorldSpaceViewDir(vs_out.posW));
    float NdotL = saturate(dot(normal, L));
    half3 I = _LightColor0.rgb * NdotL;
    UNITY_LIGHT_ATTENUATION(atten, vs_out, vs_out.posW);
    I *= atten;
    
    half3 D = I * Albedo;

    float NdotH =  saturate(dot(normal, normalize(L + V)));
    half3 S=  pow(NdotH, Shininess * 256) * Spec;

    return D + S;
}

#endif