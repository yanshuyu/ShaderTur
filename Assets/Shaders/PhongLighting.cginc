#ifndef _PhongLihting_H
#define _PhongLihting_H

#include "UnityCG.cginc"
#include "UnityLightingCommon.cginc"
#include "AutoLight.cginc"

#define UNITY_SPECCUBE_LOD_STEPS 6
#define pi 3.14159

struct VS_IN
{
    float4 vertex : POSITION;
    float3 normal : NORMAL;
    float4 tangent : TANGENT;
    float2 uv : TEXCOORD0;
    float2 uv1 : TEXCOORD1; // lightMap uv
};

struct VS_OUT
{
    float4 pos : SV_POSITION;
    float4 tangentW : TANGENT;
    float3 normalW : NORMAL;
    float3 posW : TEXCOORD0;
    float2 uv : TEXCOORD1;
    #ifdef LIGHTMAP_ON
    float2 uv_LightMap : TEXCOORD2;
    #endif
    #ifdef VERTEXLIGHT_ON
    float3 vertLightColor : TEXCOORD2;
    #endif
    SHADOW_COORDS(3)
    #if UNITY_FOG   
    float clipDepth : TEXCOORD4;
    #endif
    #ifdef SHADE_MODE_WIREFRAME
    float3 edgeDistance : TEXCOORD5;
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
    half3 S = I * Spec * pow(NdotH, Shininess * 256);

    return D + S;
}

half3 PhongLightingDeferred(half3 lightColor, float3 posW, float3 normalW, half3 Albedo, half3 Spec, half Shininess) {
    half3 L = normalize(UnityWorldSpaceLightDir(posW));
    half3 V = normalize(UnityWorldSpaceViewDir(posW));
    float NdotL = saturate(dot(normalW, L));
    half3 I = lightColor * NdotL;

    half3 D = I * Albedo;

    float NdotH =  saturate(dot(normalW, normalize(L + V)));
    half3 S = pow(NdotH, Shininess * 256) * Spec;
    
    return D + S;
}


float3 BoxProjection ( float3 sampleDir, float3 samplePos, float3 boxPos, float3 boxMin, float3 boxMax ) {
	float3 factors = ((sampleDir > 0 ? boxMax : boxMin) - samplePos) / sampleDir;
	float scalar = min(min(factors.x, factors.y), factors.z);
	return sampleDir * scalar + (samplePos - boxPos);
}

half3 ApplyFog(half3 unfogColor, float clipDepth) {
    float distance = UNITY_Z_0_FAR_FROM_CLIPSPACE(clipDepth);
    UNITY_CALC_FOG_FACTOR_RAW(distance); // will define unityFogFactor
    return lerp(unity_FogColor.rgb, unfogColor, saturate(unityFogFactor));
}

#endif