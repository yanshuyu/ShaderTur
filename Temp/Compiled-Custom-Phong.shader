// Compiled shader for Current graphics device

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/Phong" {
Properties {
 _MainTex ("Albedo(RGBA)", 2D) = "white" { }
 _Color ("Main Color(RGBA)", Color) = (0.800000,0.800000,0.800000,1.000000)
 _NormalMap ("Normal Map", 2D) = "bump" { }
 _SpecColor ("Specular Color(RGB)", Color) = (1.000000,1.000000,1.000000,1.000000)
 _Shininess ("Shininess", Range(0.000000,1.000000)) = 0.500000
 _EmissiveMap ("Emissive(RGB)", 2D) = "white" { }
 _EmissiveColor ("Emissive Color(RGB)", Color) = (0.000000,0.000000,0.000000,1.000000)
 _OcclusionMap ("Occlusion Map(R)", 2D) = "white" { }
 _OcclusionStrength ("Occlusion Strength", Range(0.000000,1.000000)) = 1.000000
 _SpecReflectivity ("Specular Reflectivity", Range(0.000000,1.000000)) = 0.500000
 _Cutoff ("Alpha Cutout Threshold", Range(0.000000,1.000000)) = 0.100000
 _EnvReflectivity ("Reflectivity", Range(0.000000,1.000000)) = 0.500000
 _EnvReflectStrength ("Strength", Range(0.000000,1.000000)) = 0.500000
[HideInInspector]  _SrcBlendFactor ("Src Blend", Float) = 1.000000
[HideInInspector]  _DstBlendFactor ("Dst Blend", Float) = 0.000000
[HideInInspector]  _Zwrite ("Z Write", Float) = 1.000000
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Geometry" "RenderType"="Opaque" }
 Pass {
  Tags { "LIGHTMODE"="SHADOWCASTER" "QUEUE"="Geometry" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


 }
 Pass {
  Tags { "LIGHTMODE"="FORWARDBASE" "QUEUE"="Geometry" "RenderType"="Opaque" }
  ZWrite [_Zwrite]
  Blend [_SrcBlendFactor] [_DstBlendFactor]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (352 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
  Vector4 _EmissiveColor at 336
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb16)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat4.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat16, u_xlat17);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat16 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat15 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat15 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat15);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 3) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: ENVRONMENT_REFLCTION_ENABLED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set CUBE Texture "unity_SpecCube0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_SpecCube0_HDR at 160
  Vector4 unity_ProbeVolumeParams at 176
  Vector3 unity_ProbeVolumeSizeInv at 256
  Vector3 unity_ProbeVolumeMin at 272
  Vector4 _LightColor0 at 288
  Vector4 _SpecColor at 304
  Vector4 _Color at 320
  Float _Shininess at 336
  Vector4 _EmissiveColor at 352
  Float _EnvReflectivity at 368
  Float _EnvReflectStrength at 372
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _EnvReflectivity;
uniform 	float _EnvReflectStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat18 = dot((-u_xlat2.xyz), gs_NORMAL0.xyz);
    u_xlat18 = u_xlat18 + u_xlat18;
    u_xlat2.xyz = gs_NORMAL0.xyz * (-vec3(u_xlat18)) + (-u_xlat2.xyz);
    u_xlat18 = (-_EnvReflectivity) + 1.0;
    u_xlat18 = u_xlat18 * 6.0;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat18);
    u_xlat16_18 = u_xlat10_2.w + -1.0;
    u_xlat18 = unity_SpecCube0_HDR.w * u_xlat16_18 + 1.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * unity_SpecCube0_HDR.y;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat18);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EnvReflectStrength) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 3) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (368 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_WorldTransformParams at 160
  Vector4 unity_ProbeVolumeParams at 176
  Vector3 unity_ProbeVolumeSizeInv at 256
  Vector3 unity_ProbeVolumeMin at 272
  Vector4 _LightColor0 at 288
  Vector4 _SpecColor at 304
  Vector4 _Color at 320
  Float _Shininess at 336
  Vector4 _EmissiveColor at 352
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec4 gs_TANGENT0;
layout(location = 1) in  vec3 gs_NORMAL0;
layout(location = 2) in  vec3 gs_TEXCOORD0;
layout(location = 3) in  vec2 gs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, gs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = gs_TANGENT0.yzx * gs_NORMAL0.zxy;
    u_xlat2.xyz = gs_NORMAL0.yzx * gs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * gs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * gs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * gs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat3.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : gs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec4 gs_TANGENT0;
layout(location = 1) out vec3 gs_NORMAL0;
layout(location = 2) out vec3 gs_TEXCOORD0;
layout(location = 3) out vec2 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED OCCLUSION_MAP_ENABLED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 2D Texture "_OcclusionMap" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (372 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_WorldTransformParams at 160
  Vector4 unity_ProbeVolumeParams at 176
  Vector3 unity_ProbeVolumeSizeInv at 256
  Vector3 unity_ProbeVolumeMin at 272
  Vector4 _LightColor0 at 288
  Vector4 _SpecColor at 304
  Vector4 _Color at 320
  Float _Shininess at 336
  Vector4 _EmissiveColor at 352
  Float _OcclusionStrength at 368
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _OcclusionStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler2D _OcclusionMap;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec4 gs_TANGENT0;
layout(location = 1) in  vec3 gs_NORMAL0;
layout(location = 2) in  vec3 gs_TEXCOORD0;
layout(location = 3) in  vec2 gs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, gs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = gs_TANGENT0.yzx * gs_NORMAL0.zxy;
    u_xlat2.xyz = gs_NORMAL0.yzx * gs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * gs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * gs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * gs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat3.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : gs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, gs_TEXCOORD1.xy);
    u_xlat16_18 = u_xlat10_3.x + -1.0;
    u_xlat18 = _OcclusionStrength * u_xlat16_18 + 1.0;
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec4 gs_TANGENT0;
layout(location = 1) out vec3 gs_NORMAL0;
layout(location = 2) out vec3 gs_TEXCOORD0;
layout(location = 3) out vec2 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (356 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
  Vector4 _EmissiveColor at 336
  Float _Cutoff at 352
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat15 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb15 = u_xlat15<0.0;
    if(((int(u_xlatb15) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb16)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat4.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat16, u_xlat17);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat16 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat15 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat15 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat15);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 3) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_TRANSPARENT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (356 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
  Vector4 _EmissiveColor at 336
  Float _SpecReflectivity at 352
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat17 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat17) * _LightColor0.xyz;
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb17)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat4.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat17, u_xlat18);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat17 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat1.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat16 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat16 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat16);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat16) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat5 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat5 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 3) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SHADE_MODE_FLAT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (352 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
  Vector4 _EmissiveColor at 336
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb16)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat4.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat16, u_xlat17);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat16 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat15 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat15 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat15);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 3) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (352 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
  Vector4 _EmissiveColor at 336
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: ENVRONMENT_REFLCTION_ENABLED VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set CUBE Texture "unity_SpecCube0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_SpecCube0_HDR at 160
  Vector4 unity_ProbeVolumeParams at 176
  Vector3 unity_ProbeVolumeSizeInv at 256
  Vector3 unity_ProbeVolumeMin at 272
  Vector4 _LightColor0 at 288
  Vector4 _SpecColor at 304
  Vector4 _Color at 320
  Float _Shininess at 336
  Vector4 _EmissiveColor at 352
  Float _EnvReflectivity at 368
  Float _EnvReflectStrength at 372
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _EnvReflectivity;
uniform 	float _EnvReflectStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat21;
float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat4.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat22, u_xlat23);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat21) + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_3 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat4.xyz = gs_NORMAL0.xyz;
    u_xlat4.w = 1.0;
    u_xlat5.x = dot(unity_SHAr, u_xlat4);
    u_xlat5.y = dot(unity_SHAg, u_xlat4);
    u_xlat5.z = dot(unity_SHAb, u_xlat4);
    u_xlat4 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat6.x = dot(unity_SHBr, u_xlat4);
    u_xlat6.y = dot(unity_SHBg, u_xlat4);
    u_xlat6.z = dot(unity_SHBb, u_xlat4);
    u_xlat21 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat21 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat21);
    u_xlat4.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat21 = dot((-u_xlat2.xyz), gs_NORMAL0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = gs_NORMAL0.xyz * (-vec3(u_xlat21)) + (-u_xlat2.xyz);
    u_xlat21 = (-_EnvReflectivity) + 1.0;
    u_xlat21 = u_xlat21 * 6.0;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat21);
    u_xlat16_21 = u_xlat10_2.w + -1.0;
    u_xlat21 = unity_SpecCube0_HDR.w * u_xlat16_21 + 1.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * unity_SpecCube0_HDR.y;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat21);
    u_xlat0.xyz = u_xlat2.xyz * vec3(_EnvReflectStrength) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat10_3.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (368 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_WorldTransformParams at 160
  Vector4 unity_ProbeVolumeParams at 176
  Vector3 unity_ProbeVolumeSizeInv at 256
  Vector3 unity_ProbeVolumeMin at 272
  Vector4 _LightColor0 at 288
  Vector4 _SpecColor at 304
  Vector4 _Color at 320
  Float _Shininess at 336
  Vector4 _EmissiveColor at 352
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec4 gs_TANGENT0;
layout(location = 1) in  vec3 gs_NORMAL0;
layout(location = 2) in  vec3 gs_TEXCOORD0;
layout(location = 3) in  vec2 gs_TEXCOORD1;
layout(location = 4) in  vec3 gs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, gs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = gs_TANGENT0.yzx * gs_NORMAL0.zxy;
    u_xlat2.xyz = gs_NORMAL0.yzx * gs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * gs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * gs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * gs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat3.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : gs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec4 gs_TANGENT0;
layout(location = 1) out vec3 gs_NORMAL0;
layout(location = 2) out vec3 gs_TEXCOORD0;
layout(location = 3) out vec2 gs_TEXCOORD1;
layout(location = 4) out vec3 gs_TEXCOORD2;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED OCCLUSION_MAP_ENABLED VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 2D Texture "_OcclusionMap" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (372 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_WorldTransformParams at 160
  Vector4 unity_ProbeVolumeParams at 176
  Vector3 unity_ProbeVolumeSizeInv at 256
  Vector3 unity_ProbeVolumeMin at 272
  Vector4 _LightColor0 at 288
  Vector4 _SpecColor at 304
  Vector4 _Color at 320
  Float _Shininess at 336
  Vector4 _EmissiveColor at 352
  Float _OcclusionStrength at 368
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _OcclusionStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler2D _OcclusionMap;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec4 gs_TANGENT0;
layout(location = 1) in  vec3 gs_NORMAL0;
layout(location = 2) in  vec3 gs_TEXCOORD0;
layout(location = 3) in  vec2 gs_TEXCOORD1;
layout(location = 4) in  vec3 gs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, gs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = gs_TANGENT0.yzx * gs_NORMAL0.zxy;
    u_xlat2.xyz = gs_NORMAL0.yzx * gs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * gs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * gs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * gs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat3.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : gs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat10_3 = texture(_OcclusionMap, gs_TEXCOORD1.xy);
    u_xlat16_18 = u_xlat10_3.x + -1.0;
    u_xlat18 = _OcclusionStrength * u_xlat16_18 + 1.0;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec4 gs_TANGENT0;
layout(location = 1) out vec3 gs_NORMAL0;
layout(location = 2) out vec3 gs_TEXCOORD0;
layout(location = 3) out vec2 gs_TEXCOORD1;
layout(location = 4) out vec3 gs_TEXCOORD2;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (356 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
  Vector4 _EmissiveColor at 336
  Float _Cutoff at 352
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_TRANSPARENT VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (356 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
  Vector4 _EmissiveColor at 336
  Float _SpecReflectivity at 352
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb20)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat4.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat20, u_xlat21);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat19 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat19 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat19);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SHADE_MODE_FLAT VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (352 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
  Vector4 _EmissiveColor at 336
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (448 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_ProbeVolumeParams at 256
  Vector3 unity_ProbeVolumeSizeInv at 336
  Vector3 unity_ProbeVolumeMin at 352
  Vector4 _LightColor0 at 368
  Vector4 _SpecColor at 384
  Vector4 _Color at 400
  Float _Shininess at 416
  Vector4 _EmissiveColor at 432
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
float u_xlat15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb17)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat4.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat17, u_xlat18);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat17 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat17 = u_xlat17 + (-u_xlat10_4.x);
    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat15 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat15 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat15);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: ENVRONMENT_REFLCTION_ENABLED SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set CUBE Texture "unity_SpecCube0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (472 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_SpecCube0_HDR at 256
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _SpecColor at 400
  Vector4 _Color at 416
  Float _Shininess at 432
  Vector4 _EmissiveColor at 448
  Float _EnvReflectivity at 464
  Float _EnvReflectStrength at 468
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _EnvReflectivity;
uniform 	float _EnvReflectStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat16_18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb20)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat4.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat20, u_xlat21);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_4.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat18 = dot((-u_xlat2.xyz), gs_NORMAL0.xyz);
    u_xlat18 = u_xlat18 + u_xlat18;
    u_xlat2.xyz = gs_NORMAL0.xyz * (-vec3(u_xlat18)) + (-u_xlat2.xyz);
    u_xlat18 = (-_EnvReflectivity) + 1.0;
    u_xlat18 = u_xlat18 * 6.0;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat18);
    u_xlat16_18 = u_xlat10_2.w + -1.0;
    u_xlat18 = unity_SpecCube0_HDR.w * u_xlat16_18 + 1.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * unity_SpecCube0_HDR.y;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat18);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EnvReflectStrength) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 2D Texture "_EmissiveMap" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (464 bytes) {
  Matrix4x4 unity_MatrixV at 208
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_WorldTransformParams at 192
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _SpecColor at 400
  Vector4 _Color at 416
  Float _Shininess at 432
  Vector4 _EmissiveColor at 448
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec4 gs_TANGENT0;
layout(location = 1) in  vec3 gs_NORMAL0;
layout(location = 2) in  vec3 gs_TEXCOORD0;
layout(location = 3) in  vec2 gs_TEXCOORD1;
layout(location = 4) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, gs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = gs_TANGENT0.yzx * gs_NORMAL0.zxy;
    u_xlat2.xyz = gs_NORMAL0.yzx * gs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * gs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * gs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * gs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat3.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat5.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : gs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec4 gs_TANGENT0;
layout(location = 1) out vec3 gs_NORMAL0;
layout(location = 2) out vec3 gs_TEXCOORD0;
layout(location = 3) out vec2 gs_TEXCOORD1;
layout(location = 4) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED OCCLUSION_MAP_ENABLED SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 2D Texture "_EmissiveMap" to slot 3
Set 2D Texture "_OcclusionMap" to slot 4
Set 3D Texture "unity_ProbeVolumeSH" to slot 5

Constant Buffer "$Globals" (468 bytes) {
  Matrix4x4 unity_MatrixV at 208
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_WorldTransformParams at 192
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _SpecColor at 400
  Vector4 _Color at 416
  Float _Shininess at 432
  Vector4 _EmissiveColor at 448
  Float _OcclusionStrength at 464
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _OcclusionStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(4) uniform  sampler2D _OcclusionMap;
UNITY_LOCATION(5) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec4 gs_TANGENT0;
layout(location = 1) in  vec3 gs_NORMAL0;
layout(location = 2) in  vec3 gs_TEXCOORD0;
layout(location = 3) in  vec2 gs_TEXCOORD1;
layout(location = 4) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat16_18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, gs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = gs_TANGENT0.yzx * gs_NORMAL0.zxy;
    u_xlat2.xyz = gs_NORMAL0.yzx * gs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * gs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * gs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * gs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat3.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat5.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : gs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat10_3 = texture(_OcclusionMap, gs_TEXCOORD1.xy);
    u_xlat16_18 = u_xlat10_3.x + -1.0;
    u_xlat18 = _OcclusionStrength * u_xlat16_18 + 1.0;
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec4 gs_TANGENT0;
layout(location = 1) out vec3 gs_NORMAL0;
layout(location = 2) out vec3 gs_TEXCOORD0;
layout(location = 3) out vec2 gs_TEXCOORD1;
layout(location = 4) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (452 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_ProbeVolumeParams at 256
  Vector3 unity_ProbeVolumeSizeInv at 336
  Vector3 unity_ProbeVolumeMin at 352
  Vector4 _LightColor0 at 368
  Vector4 _SpecColor at 384
  Vector4 _Color at 400
  Float _Shininess at 416
  Vector4 _EmissiveColor at 432
  Float _Cutoff at 448
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat15 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb15 = u_xlat15<0.0;
    if(((int(u_xlatb15) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb17)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat4.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat17, u_xlat18);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat17 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat17 = u_xlat17 + (-u_xlat10_4.x);
    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat15 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat15 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat15);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_TRANSPARENT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (452 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_ProbeVolumeParams at 256
  Vector3 unity_ProbeVolumeSizeInv at 336
  Vector3 unity_ProbeVolumeMin at 352
  Vector4 _LightColor0 at 368
  Vector4 _SpecColor at 384
  Vector4 _Color at 400
  Float _Shininess at 416
  Vector4 _EmissiveColor at 432
  Float _SpecReflectivity at 448
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat16;
float u_xlat17;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat17 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat17) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat17) + u_xlat18;
    u_xlat17 = unity_ShadowFadeCenterAndType.w * u_xlat18 + u_xlat17;
    u_xlat17 = u_xlat17 * _LightShadowData.z + _LightShadowData.w;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat4.y * 0.25 + 0.75;
        u_xlat9 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat18, u_xlat9);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat18 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat18 = u_xlat18 + (-u_xlat10_4.x);
    u_xlat17 = u_xlat17 * u_xlat18 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat1.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat16 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat16 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat16);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat16) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat5 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat5 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SHADE_MODE_FLAT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (448 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_ProbeVolumeParams at 256
  Vector3 unity_ProbeVolumeSizeInv at 336
  Vector3 unity_ProbeVolumeMin at 352
  Vector4 _LightColor0 at 368
  Vector4 _SpecColor at 384
  Vector4 _Color at 400
  Float _Shininess at 416
  Vector4 _EmissiveColor at 432
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
float u_xlat15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb17)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat4.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat17, u_xlat18);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat17 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat17 = u_xlat17 + (-u_xlat10_4.x);
    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat2.xyz = gs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat2 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat15 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat15 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat15);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 4) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (448 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_ProbeVolumeParams at 256
  Vector3 unity_ProbeVolumeSizeInv at 336
  Vector3 unity_ProbeVolumeMin at 352
  Vector4 _LightColor0 at 368
  Vector4 _SpecColor at 384
  Vector4 _Color at 400
  Float _Shininess at 416
  Vector4 _EmissiveColor at 432
}
Constant Buffer "$Globals" (416 bytes) {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 336
  Vector4 _ProjectionParams at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 _MainTex_ST at 400
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
layout(location = 5) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TANGENT0.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_NORMAL0.xyz = u_xlat2.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 4) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb20)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat4.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat20, u_xlat21);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_4.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(location = 5) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 5) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(location = 4) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: ENVRONMENT_REFLCTION_ENABLED SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set CUBE Texture "unity_SpecCube0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (472 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_SpecCube0_HDR at 256
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _SpecColor at 400
  Vector4 _Color at 416
  Float _Shininess at 432
  Vector4 _EmissiveColor at 448
  Float _EnvReflectivity at 464
  Float _EnvReflectStrength at 468
}
Constant Buffer "$Globals" (416 bytes) {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 336
  Vector4 _ProjectionParams at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 _MainTex_ST at 400
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
layout(location = 5) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TANGENT0.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_NORMAL0.xyz = u_xlat2.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _EnvReflectivity;
uniform 	float _EnvReflectStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 4) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat21;
float u_xlat16_21;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat4.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat23, u_xlat24);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_4.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat21) + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_3 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat4.xyz = gs_NORMAL0.xyz;
    u_xlat4.w = 1.0;
    u_xlat5.x = dot(unity_SHAr, u_xlat4);
    u_xlat5.y = dot(unity_SHAg, u_xlat4);
    u_xlat5.z = dot(unity_SHAb, u_xlat4);
    u_xlat4 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat6.x = dot(unity_SHBr, u_xlat4);
    u_xlat6.y = dot(unity_SHBg, u_xlat4);
    u_xlat6.z = dot(unity_SHBb, u_xlat4);
    u_xlat21 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat21 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat21);
    u_xlat4.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat21 = dot((-u_xlat2.xyz), gs_NORMAL0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = gs_NORMAL0.xyz * (-vec3(u_xlat21)) + (-u_xlat2.xyz);
    u_xlat21 = (-_EnvReflectivity) + 1.0;
    u_xlat21 = u_xlat21 * 6.0;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat21);
    u_xlat16_21 = u_xlat10_2.w + -1.0;
    u_xlat21 = unity_SpecCube0_HDR.w * u_xlat16_21 + 1.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * unity_SpecCube0_HDR.y;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat21);
    u_xlat0.xyz = u_xlat2.xyz * vec3(_EnvReflectStrength) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat10_3.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(location = 5) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 5) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(location = 4) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 2D Texture "_EmissiveMap" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (464 bytes) {
  Matrix4x4 unity_MatrixV at 208
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_WorldTransformParams at 192
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _SpecColor at 400
  Vector4 _Color at 416
  Float _Shininess at 432
  Vector4 _EmissiveColor at 448
}
Constant Buffer "$Globals" (416 bytes) {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 336
  Vector4 _ProjectionParams at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 _MainTex_ST at 400
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
layout(location = 5) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TANGENT0.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_NORMAL0.xyz = u_xlat2.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec4 gs_TANGENT0;
layout(location = 1) in  vec3 gs_NORMAL0;
layout(location = 2) in  vec3 gs_TEXCOORD0;
layout(location = 3) in  vec2 gs_TEXCOORD1;
layout(location = 4) in  vec3 gs_TEXCOORD2;
layout(location = 5) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, gs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = gs_TANGENT0.yzx * gs_NORMAL0.zxy;
    u_xlat2.xyz = gs_NORMAL0.yzx * gs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * gs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * gs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * gs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat3.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat5.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : gs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(location = 5) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec4 gs_TANGENT0;
layout(location = 1) out vec3 gs_NORMAL0;
layout(location = 2) out vec3 gs_TEXCOORD0;
layout(location = 3) out vec2 gs_TEXCOORD1;
layout(location = 4) out vec3 gs_TEXCOORD2;
layout(location = 5) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED OCCLUSION_MAP_ENABLED SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 2D Texture "_EmissiveMap" to slot 3
Set 2D Texture "_OcclusionMap" to slot 4
Set 3D Texture "unity_ProbeVolumeSH" to slot 5

Constant Buffer "$Globals" (468 bytes) {
  Matrix4x4 unity_MatrixV at 208
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_WorldTransformParams at 192
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _SpecColor at 400
  Vector4 _Color at 416
  Float _Shininess at 432
  Vector4 _EmissiveColor at 448
  Float _OcclusionStrength at 464
}
Constant Buffer "$Globals" (416 bytes) {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 336
  Vector4 _ProjectionParams at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 _MainTex_ST at 400
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
layout(location = 5) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TANGENT0.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_NORMAL0.xyz = u_xlat2.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _OcclusionStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(4) uniform  sampler2D _OcclusionMap;
UNITY_LOCATION(5) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec4 gs_TANGENT0;
layout(location = 1) in  vec3 gs_NORMAL0;
layout(location = 2) in  vec3 gs_TEXCOORD0;
layout(location = 3) in  vec2 gs_TEXCOORD1;
layout(location = 4) in  vec3 gs_TEXCOORD2;
layout(location = 5) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat16_18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, gs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = gs_TANGENT0.yzx * gs_NORMAL0.zxy;
    u_xlat2.xyz = gs_NORMAL0.yzx * gs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * gs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * gs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * gs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat3.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat5.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : gs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat10_3 = texture(_OcclusionMap, gs_TEXCOORD1.xy);
    u_xlat16_18 = u_xlat10_3.x + -1.0;
    u_xlat18 = _OcclusionStrength * u_xlat16_18 + 1.0;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(location = 5) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec4 gs_TANGENT0;
layout(location = 1) out vec3 gs_NORMAL0;
layout(location = 2) out vec3 gs_TEXCOORD0;
layout(location = 3) out vec2 gs_TEXCOORD1;
layout(location = 4) out vec3 gs_TEXCOORD2;
layout(location = 5) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (452 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_ProbeVolumeParams at 256
  Vector3 unity_ProbeVolumeSizeInv at 336
  Vector3 unity_ProbeVolumeMin at 352
  Vector4 _LightColor0 at 368
  Vector4 _SpecColor at 384
  Vector4 _Color at 400
  Float _Shininess at 416
  Vector4 _EmissiveColor at 432
  Float _Cutoff at 448
}
Constant Buffer "$Globals" (416 bytes) {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 336
  Vector4 _ProjectionParams at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 _MainTex_ST at 400
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
layout(location = 5) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TANGENT0.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_NORMAL0.xyz = u_xlat2.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 4) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb20)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat4.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat20, u_xlat21);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_4.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(location = 5) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 5) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(location = 4) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_TRANSPARENT SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (452 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_ProbeVolumeParams at 256
  Vector3 unity_ProbeVolumeSizeInv at 336
  Vector3 unity_ProbeVolumeMin at 352
  Vector4 _LightColor0 at 368
  Vector4 _SpecColor at 384
  Vector4 _Color at 400
  Float _Shininess at 416
  Vector4 _EmissiveColor at 432
  Float _SpecReflectivity at 448
}
Constant Buffer "$Globals" (416 bytes) {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 336
  Vector4 _ProjectionParams at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 _MainTex_ST at 400
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
layout(location = 5) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TANGENT0.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_NORMAL0.xyz = u_xlat2.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 4) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat10;
float u_xlat19;
float u_xlat20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat20) + u_xlat21;
    u_xlat20 = unity_ShadowFadeCenterAndType.w * u_xlat21 + u_xlat20;
    u_xlat20 = u_xlat20 * _LightShadowData.z + _LightShadowData.w;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlatb21 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat4.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat21, u_xlat10);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat21 = u_xlat21 + (-u_xlat10_4.x);
    u_xlat20 = u_xlat20 * u_xlat21 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat19 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat19 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat19);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(location = 5) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 5) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(location = 4) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SHADE_MODE_FLAT SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (448 bytes) {
  Matrix4x4 unity_MatrixV at 192
  Matrix4x4 unity_ProbeVolumeWorldToObject at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_OcclusionMaskSelector at 144
  Vector4 _LightShadowData at 160
  Vector4 unity_ShadowFadeCenterAndType at 176
  Vector4 unity_ProbeVolumeParams at 256
  Vector3 unity_ProbeVolumeSizeInv at 336
  Vector3 unity_ProbeVolumeMin at 352
  Vector4 _LightColor0 at 368
  Vector4 _SpecColor at 384
  Vector4 _Color at 400
  Float _Shininess at 416
  Vector4 _EmissiveColor at 432
}
Constant Buffer "$Globals" (416 bytes) {
  Matrix4x4 unity_ObjectToWorld at 208
  Matrix4x4 unity_WorldToObject at 272
  Matrix4x4 unity_MatrixVP at 336
  Vector4 _ProjectionParams at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 _MainTex_ST at 400
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
layout(location = 0) out vec4 vs_TANGENT0;
layout(location = 1) out vec3 vs_NORMAL0;
layout(location = 2) out vec3 vs_TEXCOORD0;
layout(location = 3) out vec2 vs_TEXCOORD1;
layout(location = 4) out vec3 vs_TEXCOORD2;
layout(location = 5) out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TANGENT0.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_NORMAL0.xyz = u_xlat2.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 410
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
layout(location = 0) in  vec3 gs_NORMAL0;
layout(location = 1) in  vec3 gs_TEXCOORD0;
layout(location = 2) in  vec2 gs_TEXCOORD1;
layout(location = 3) in  vec3 gs_TEXCOORD2;
layout(location = 4) in  vec4 gs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, gs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = gs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = gs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * gs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * gs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb20)) ? u_xlat4.xyz : gs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat4.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat20, u_xlat21);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat4.xy = gs_TEXCOORD3.xy / gs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_4.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(gs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_2 = texture(_EmissiveMap, gs_TEXCOORD1.xy);
    u_xlat3.xyz = gs_NORMAL0.xyz;
    u_xlat3.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat3);
    u_xlat4.y = dot(unity_SHAg, u_xlat3);
    u_xlat4.z = dot(unity_SHAb, u_xlat3);
    u_xlat3 = gs_NORMAL0.yzzx * gs_NORMAL0.xyzz;
    u_xlat5.x = dot(unity_SHBr, u_xlat3);
    u_xlat5.y = dot(unity_SHBg, u_xlat3);
    u_xlat5.z = dot(unity_SHBb, u_xlat3);
    u_xlat18 = gs_NORMAL0.y * gs_NORMAL0.y;
    u_xlat18 = gs_NORMAL0.x * gs_NORMAL0.x + (-u_xlat18);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat0.xyz = gs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat10_2.xyz * _EmissiveColor.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
#ifdef GEOMETRY
#version 410
#extension GL_ARB_explicit_attrib_location : require

layout(location = 0) in  vec4 vs_TANGENT0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
layout(location = 2) in  vec3 vs_TEXCOORD0 [3];
layout(location = 3) in  vec2 vs_TEXCOORD1 [3];
layout(location = 4) in  vec3 vs_TEXCOORD2 [3];
layout(location = 5) in  vec4 vs_TEXCOORD3 [3];
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 5) out vec4 gs_TANGENT0;
layout(location = 0) out vec3 gs_NORMAL0;
layout(location = 1) out vec3 gs_TEXCOORD0;
layout(location = 2) out vec2 gs_TEXCOORD1;
layout(location = 3) out vec3 gs_TEXCOORD2;
layout(location = 4) out vec4 gs_TEXCOORD3;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[0];
    gs_NORMAL0.xyz = vs_NORMAL0[0].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[0].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[0].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[0].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[0];
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[1];
    gs_NORMAL0.xyz = vs_NORMAL0[1].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[1].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[1].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[1].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[1];
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TANGENT0 = vs_TANGENT0[2];
    gs_NORMAL0.xyz = vs_NORMAL0[2].xyz;
    gs_TEXCOORD0.xyz = vs_TEXCOORD0[2].xyz;
    gs_TEXCOORD1.xy = vs_TEXCOORD1[2].xy;
    gs_TEXCOORD2.xyz = vs_TEXCOORD2[2].xyz;
    gs_TEXCOORD3 = vs_TEXCOORD3[2];
    EmitVertex();
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


-- Hardware tier variant: Tier 1
-- Geometry shader for "glcore":
Shader Disassembly:


 }
 Pass {
  Tags { "LIGHTMODE"="FORWARDADD" "QUEUE"="Geometry" "RenderType"="Opaque" }
  ZWrite Off
  Blend [_SrcBlendFactor] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: POINT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (276 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat20));
    u_xlat19 = u_xlat19 * u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL NORMAL_MAP_ENABLED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (228 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 80
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_WorldTransformParams at 48
  Vector4 unity_ProbeVolumeParams at 64
  Vector3 unity_ProbeVolumeSizeInv at 144
  Vector3 unity_ProbeVolumeMin at 160
  Vector4 _LightColor0 at 176
  Vector4 _SpecColor at 192
  Vector4 _Color at 208
  Float _Shininess at 224
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL RENDER_MODE_CUTOUT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 1

Constant Buffer "$Globals" (216 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 192
  Float _Shininess at 208
  Float _Cutoff at 212
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat15 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb15 = u_xlat15<0.0;
    if(((int(u_xlatb15) * int(0xffffffffu)))!=0){discard;}
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb16)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat4.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat16, u_xlat17);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat16 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL RENDER_MODE_TRANSPARENT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 1

Constant Buffer "$Globals" (216 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 192
  Float _Shininess at 208
  Float _SpecReflectivity at 212
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat17 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat17) * _LightColor0.xyz;
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb17)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat4.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat17, u_xlat18);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat17 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat1.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat5 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat5 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 1

Constant Buffer "$Globals" (212 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 192
  Float _Shininess at 208
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb16)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat4.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat16, u_xlat17);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat16 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 2D Texture "_LightTextureB0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (292 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 80
  Matrix4x4 unity_WorldToLight at 208
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_WorldTransformParams at 48
  Vector4 unity_ProbeVolumeParams at 64
  Vector3 unity_ProbeVolumeSizeInv at 144
  Vector3 unity_ProbeVolumeMin at 160
  Vector4 _LightColor0 at 176
  Vector4 _SpecColor at 192
  Vector4 _Color at 272
  Float _Shininess at 288
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat8;
float u_xlat15;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat8.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat5 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat5 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD0.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD0.zzzz + u_xlat5;
    u_xlat5 = u_xlat5 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat6.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = 0.0<u_xlat5.z;
    u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
    u_xlat6.xy = u_xlat5.xy / u_xlat5.ww;
    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy);
    u_xlat23 = u_xlat23 * u_xlat10_6.w;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat24));
    u_xlat23 = u_xlat23 * u_xlat10_5.x;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (280 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
  Float _Cutoff at 276
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD0.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = 0.0<u_xlat4.z;
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat20 = u_xlat20 * u_xlat10_5.w;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat21));
    u_xlat20 = u_xlat20 * u_xlat10_4.x;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_TRANSPARENT SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (280 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
  Float _SpecReflectivity at 276
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD0.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlatb21 = 0.0<u_xlat4.z;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat21 = u_xlat21 * u_xlat10_5.w;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, u_xlat4.xx);
    u_xlat21 = u_xlat21 * u_xlat10_4.x;
    u_xlat20 = u_xlat20 * u_xlat21;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (276 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD0.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = 0.0<u_xlat4.z;
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat20 = u_xlat20 * u_xlat10_5.w;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat21));
    u_xlat20 = u_xlat20 * u_xlat10_4.x;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED POINT_COOKIE 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set CUBE Texture "_LightTexture0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (292 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 80
  Matrix4x4 unity_WorldToLight at 208
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_WorldTransformParams at 48
  Vector4 unity_ProbeVolumeParams at 64
  Vector3 unity_ProbeVolumeSizeInv at 144
  Vector3 unity_ProbeVolumeMin at 160
  Vector4 _LightColor0 at 176
  Vector4 _SpecColor at 192
  Vector4 _Color at 272
  Float _Shininess at 288
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform  samplerCube _LightTexture0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat8;
float u_xlat15;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
float u_xlat16_23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat8.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat6.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_6 = texture(_LightTextureB0, vec2(u_xlat23));
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xyz);
    u_xlat16_23 = u_xlat10_5.w * u_xlat10_6.x;
    u_xlat22 = u_xlat22 * u_xlat16_23;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT_COOKIE RENDER_MODE_CUTOUT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTextureB0" to slot 1
Set CUBE Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (280 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
  Float _Cutoff at 276
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(2) uniform  samplerCube _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
float u_xlat16_20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat20));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_20 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat19 = u_xlat19 * u_xlat16_20;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT_COOKIE RENDER_MODE_TRANSPARENT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTextureB0" to slot 1
Set CUBE Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (280 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
  Float _SpecReflectivity at 276
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(2) uniform  samplerCube _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
float u_xlat16_21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat21));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_21 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat20 = u_xlat20 * u_xlat16_21;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT_COOKIE 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTextureB0" to slot 1
Set CUBE Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (276 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(2) uniform  samplerCube _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
float u_xlat16_20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat20));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_20 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat19 = u_xlat19 * u_xlat16_20;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE NORMAL_MAP_ENABLED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (292 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 80
  Matrix4x4 unity_WorldToLight at 208
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_WorldTransformParams at 48
  Vector4 unity_ProbeVolumeParams at 64
  Vector3 unity_ProbeVolumeSizeInv at 144
  Vector3 unity_ProbeVolumeMin at 160
  Vector4 _LightColor0 at 176
  Vector4 _SpecColor at 192
  Vector4 _Color at 272
  Float _Shininess at 288
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec3 u_xlat8;
float u_xlat15;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat8.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat5.xy = vs_TEXCOORD0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD0.xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD0.zz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat6.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat22 = u_xlat22 * u_xlat10_5.w;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE RENDER_MODE_CUTOUT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (280 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
  Float _Cutoff at 276
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xy = vs_TEXCOORD0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD0.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD0.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat19 = u_xlat19 * u_xlat10_4.w;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE RENDER_MODE_TRANSPARENT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (280 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
  Float _SpecReflectivity at 276
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4.xy = vs_TEXCOORD0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD0.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD0.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat20 = u_xlat20 * u_xlat10_4.w;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (276 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xy = vs_TEXCOORD0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD0.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD0.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat19 = u_xlat19 * u_xlat10_4.w;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED POINT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (292 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 80
  Matrix4x4 unity_WorldToLight at 208
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_WorldTransformParams at 48
  Vector4 unity_ProbeVolumeParams at 64
  Vector3 unity_ProbeVolumeSizeInv at 144
  Vector3 unity_ProbeVolumeMin at 160
  Vector4 _LightColor0 at 176
  Vector4 _SpecColor at 192
  Vector4 _Color at 272
  Float _Shininess at 288
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec3 u_xlat8;
float u_xlat15;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat8.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat6.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_5 = texture(_LightTexture0, vec2(u_xlat23));
    u_xlat22 = u_xlat22 * u_xlat10_5.x;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT RENDER_MODE_CUTOUT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (280 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
  Float _Cutoff at 276
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat20));
    u_xlat19 = u_xlat19 * u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT RENDER_MODE_TRANSPARENT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (280 bytes) {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 192
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _SpecColor at 176
  Vector4 _Color at 256
  Float _Shininess at 272
  Float _SpecReflectivity at 276
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat21));
    u_xlat20 = u_xlat20 * u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (372 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat20));
    u_xlat19 = u_xlat19 * u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL NORMAL_MAP_ENABLED SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (324 bytes) {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_WorldTransformParams at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 304
  Float _Shininess at 320
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat7;
float u_xlat13;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = sqrt(u_xlat18);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat7.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL RENDER_MODE_CUTOUT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (312 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 288
  Float _Shininess at 304
  Float _Cutoff at 308
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat15 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb15 = u_xlat15<0.0;
    if(((int(u_xlatb15) * int(0xffffffffu)))!=0){discard;}
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb17)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat4.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat17, u_xlat18);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat17 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat17 = u_xlat17 + (-u_xlat10_4.x);
    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL RENDER_MODE_TRANSPARENT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (312 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 288
  Float _Shininess at 304
  Float _SpecReflectivity at 308
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat9;
float u_xlat16;
float u_xlat17;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat17 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat17) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat17) + u_xlat18;
    u_xlat17 = unity_ShadowFadeCenterAndType.w * u_xlat18 + u_xlat17;
    u_xlat17 = u_xlat17 * _LightShadowData.z + _LightShadowData.w;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb18)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat4.y * 0.25 + 0.75;
        u_xlat9 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat18, u_xlat9);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat18 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat18 = u_xlat18 + (-u_xlat10_4.x);
    u_xlat17 = u_xlat17 * u_xlat18 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat1.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat5 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat5 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2

Constant Buffer "$Globals" (308 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 288
  Float _Shininess at 304
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
float u_xlat15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat4.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb17)) ? u_xlat4.xyz : vs_TEXCOORD0.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat4.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat17, u_xlat18);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat17 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat17 = u_xlat17 + (-u_xlat10_4.x);
    u_xlat16 = u_xlat16 * u_xlat17 + u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat16 = _Shininess * 256.0;
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED SHADOWS_SCREEN SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 2D Texture "_LightTexture0" to slot 3
Set 2D Texture "_LightTextureB0" to slot 4
Set 3D Texture "unity_ProbeVolumeSH" to slot 5

Constant Buffer "$Globals" (388 bytes) {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 304
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_WorldTransformParams at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 368
  Float _Shininess at 384
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(4) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(5) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat8;
float u_xlat15;
float u_xlat21;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat8.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat5 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat5 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD0.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD0.zzzz + u_xlat5;
    u_xlat5 = u_xlat5 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb23)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat6.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat23, u_xlat24);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat6.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat6.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_6.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_6.x;
    u_xlatb23 = 0.0<u_xlat5.z;
    u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
    u_xlat6.xy = u_xlat5.xy / u_xlat5.ww;
    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy);
    u_xlat23 = u_xlat23 * u_xlat10_6.w;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat24));
    u_xlat23 = u_xlat23 * u_xlat10_5.x;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT SHADOWS_SCREEN SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 2D Texture "_LightTextureB0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
  Float _Cutoff at 372
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD0.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlatb20 = 0.0<u_xlat4.z;
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat20 = u_xlat20 * u_xlat10_5.w;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat21));
    u_xlat20 = u_xlat20 * u_xlat10_4.x;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_TRANSPARENT SHADOWS_SCREEN SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 2D Texture "_LightTextureB0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
  Float _SpecReflectivity at 372
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat11;
float u_xlat19;
float u_xlat20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD0.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat20) + u_xlat21;
    u_xlat20 = unity_ShadowFadeCenterAndType.w * u_xlat21 + u_xlat20;
    u_xlat20 = u_xlat20 * _LightShadowData.z + _LightShadowData.w;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlatb21 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat5.y * 0.25 + 0.75;
        u_xlat11 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat21, u_xlat11);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat21 = u_xlat21 + (-u_xlat10_5.x);
    u_xlat20 = u_xlat20 * u_xlat21 + u_xlat10_5.x;
    u_xlatb21 = 0.0<u_xlat4.z;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat21 = u_xlat21 * u_xlat10_5.w;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, u_xlat4.xx);
    u_xlat21 = u_xlat21 * u_xlat10_4.x;
    u_xlat20 = u_xlat20 * u_xlat21;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SHADOWS_SCREEN SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 2D Texture "_LightTextureB0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (372 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD0.zzzz + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlatb20 = 0.0<u_xlat4.z;
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat20 = u_xlat20 * u_xlat10_5.w;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTextureB0, vec2(u_xlat21));
    u_xlat20 = u_xlat20 * u_xlat10_4.x;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED POINT_COOKIE SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 2D Texture "_LightTextureB0" to slot 3
Set CUBE Texture "_LightTexture0" to slot 4
Set 3D Texture "unity_ProbeVolumeSH" to slot 5

Constant Buffer "$Globals" (388 bytes) {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 304
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_WorldTransformParams at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 368
  Float _Shininess at 384
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(4) uniform  samplerCube _LightTexture0;
UNITY_LOCATION(5) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat8;
float u_xlat15;
float u_xlat21;
float u_xlat22;
float u_xlat23;
float u_xlat16_23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat8.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb23)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat6.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat23, u_xlat24);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat6.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat6.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_6.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_6.x;
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_6 = texture(_LightTextureB0, vec2(u_xlat23));
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xyz);
    u_xlat16_23 = u_xlat10_5.w * u_xlat10_6.x;
    u_xlat22 = u_xlat22 * u_xlat16_23;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT_COOKIE RENDER_MODE_CUTOUT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set CUBE Texture "_LightTexture0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
  Float _Cutoff at 372
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform  samplerCube _LightTexture0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
float u_xlat20;
float u_xlat16_20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat20));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_20 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat19 = u_xlat19 * u_xlat16_20;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT_COOKIE RENDER_MODE_TRANSPARENT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set CUBE Texture "_LightTexture0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
  Float _SpecReflectivity at 372
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform  samplerCube _LightTexture0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat19;
float u_xlat20;
float u_xlat21;
float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat20) + u_xlat21;
    u_xlat20 = unity_ShadowFadeCenterAndType.w * u_xlat21 + u_xlat20;
    u_xlat20 = u_xlat20 * _LightShadowData.z + _LightShadowData.w;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlatb21 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat5.y * 0.25 + 0.75;
        u_xlat22 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat21, u_xlat22);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat21 = u_xlat21 + (-u_xlat10_5.x);
    u_xlat20 = u_xlat20 * u_xlat21 + u_xlat10_5.x;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat21));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_21 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat20 = u_xlat20 * u_xlat16_21;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT_COOKIE SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set CUBE Texture "_LightTexture0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (372 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform  samplerCube _LightTexture0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
float u_xlat19;
float u_xlat20;
float u_xlat16_20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat20));
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_20 = u_xlat10_4.w * u_xlat10_5.x;
    u_xlat19 = u_xlat19 * u_xlat16_20;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE NORMAL_MAP_ENABLED SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 2D Texture "_LightTexture0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (388 bytes) {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 304
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_WorldTransformParams at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 368
  Float _Shininess at 384
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat8;
float u_xlat15;
vec2 u_xlat19;
float u_xlat21;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat8.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat5.xy = vs_TEXCOORD0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD0.xx + u_xlat5.xy;
    u_xlat5.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD0.zz + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb23)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat6.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat23, u_xlat24);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat19.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat19.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_6.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_6.x;
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xy);
    u_xlat22 = u_xlat22 * u_xlat10_5.w;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE RENDER_MODE_CUTOUT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
  Float _Cutoff at 372
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xy = vs_TEXCOORD0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD0.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD0.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat16.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat16.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat19 = u_xlat19 * u_xlat10_4.w;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE RENDER_MODE_TRANSPARENT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
  Float _SpecReflectivity at 372
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4.xy = vs_TEXCOORD0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD0.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD0.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat20) + u_xlat21;
    u_xlat20 = unity_ShadowFadeCenterAndType.w * u_xlat21 + u_xlat20;
    u_xlat20 = u_xlat20 * _LightShadowData.z + _LightShadowData.w;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlatb21 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat5.y * 0.25 + 0.75;
        u_xlat16.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat21, u_xlat16.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat16.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat16.xy);
    u_xlat21 = u_xlat21 + (-u_xlat10_5.x);
    u_xlat20 = u_xlat20 * u_xlat21 + u_xlat10_5.x;
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat20 = u_xlat20 * u_xlat10_4.w;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (372 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec2 u_xlat16;
float u_xlat18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xy = vs_TEXCOORD0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD0.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD0.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat16.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat16.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat19 = u_xlat19 * u_xlat10_4.w;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED POINT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_ShadowMapTexture" to slot 2
Set 2D Texture "_LightTexture0" to slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 4

Constant Buffer "$Globals" (388 bytes) {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 304
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_WorldTransformParams at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _SpecColor at 288
  Vector4 _Color at 368
  Float _Shininess at 384
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(4) uniform  sampler3D unity_ProbeVolumeSH;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat8;
float u_xlat15;
float u_xlat21;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat2.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat2.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vs_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat8.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat6.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = unity_ShadowFadeCenterAndType.w * u_xlat23 + u_xlat22;
    u_xlat22 = u_xlat22 * _LightShadowData.z + _LightShadowData.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb23)) ? u_xlat6.xyz : vs_TEXCOORD0.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat23 = u_xlat6.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat23, u_xlat24);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat6.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat6.xy);
    u_xlat23 = u_xlat23 + (-u_xlat10_6.x);
    u_xlat22 = u_xlat22 * u_xlat23 + u_xlat10_6.x;
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_5 = texture(_LightTexture0, vec2(u_xlat23));
    u_xlat22 = u_xlat22 * u_xlat10_5.x;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    u_xlat22 = _Shininess * 256.0;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT RENDER_MODE_CUTOUT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
  Float _Cutoff at 372
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat18 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlatb18 = u_xlat18<0.0;
    if(((int(u_xlatb18) * int(0xffffffffu)))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat19 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb20 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb20)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat20 = u_xlat5.y * 0.25 + 0.75;
        u_xlat21 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat20, u_xlat21);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat20 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat20 = u_xlat20 + (-u_xlat10_5.x);
    u_xlat19 = u_xlat19 * u_xlat20 + u_xlat10_5.x;
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat20));
    u_xlat19 = u_xlat19 * u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat19 = _Shininess * 256.0;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat18 = exp2(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT RENDER_MODE_TRANSPARENT SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3

Constant Buffer "$Globals" (376 bytes) {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _SpecColor at 272
  Vector4 _Color at 352
  Float _Shininess at 368
  Float _SpecReflectivity at 372
}
Constant Buffer "$Globals" (224 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TANGENT0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_NORMAL0.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _SpecReflectivity;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _ShadowMapTexture;
UNITY_LOCATION(2) uniform  sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform  sampler3D unity_ProbeVolumeSH;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat19;
float u_xlat20;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_0 * _Color;
    u_xlat0.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat20 = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat20) * _LightColor0.xyz;
    u_xlat4.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat21 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat20) + u_xlat21;
    u_xlat20 = unity_ShadowFadeCenterAndType.w * u_xlat21 + u_xlat20;
    u_xlat20 = u_xlat20 * _LightShadowData.z + _LightShadowData.w;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlatb21 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD0.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD0.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat5.y * 0.25 + 0.75;
        u_xlat22 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat21, u_xlat22);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat5.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat5.xy);
    u_xlat21 = u_xlat21 + (-u_xlat10_5.x);
    u_xlat20 = u_xlat20 * u_xlat21 + u_xlat10_5.x;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_4 = texture(_LightTexture0, vec2(u_xlat21));
    u_xlat20 = u_xlat20 * u_xlat10_4.x;
    u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7.xyz = u_xlat3.xyz * _SpecColor.xyz;
    u_xlat2.x = _Shininess * 256.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = (-u_xlat10_0.w) * _Color.w + 1.0;
    u_xlat6 = (-_SpecReflectivity) + 1.0;
    SV_Target0.w = (-u_xlat0.x) * u_xlat6 + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


 }
 Pass {
  Tags { "LIGHTMODE"="DEFERRED" "QUEUE"="Geometry" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1

Constant Buffer "$Globals" (176 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 _SpecColor at 112
  Vector4 _Color at 128
  Float _Shininess at 144
  Vector4 _EmissiveColor at 160
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat0.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat0.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat0.x);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vs_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: ENVRONMENT_REFLCTION_ENABLED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set CUBE Texture "unity_SpecCube0" to slot 2

Constant Buffer "$Globals" (208 bytes) {
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_SHAr at 16
  Vector4 unity_SHAg at 32
  Vector4 unity_SHAb at 48
  Vector4 unity_SHBr at 64
  Vector4 unity_SHBg at 80
  Vector4 unity_SHBb at 96
  Vector4 unity_SHC at 112
  Vector4 unity_SpecCube0_HDR at 128
  Vector4 _SpecColor at 144
  Vector4 _Color at 160
  Float _Shininess at 176
  Float _EnvReflectivity at 180
  Float _EnvReflectStrength at 184
  Vector4 _EmissiveColor at 192
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _EnvReflectivity;
uniform 	float _EnvReflectStrength;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  samplerCube unity_SpecCube0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
float u_xlat16_12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot((-u_xlat0.xyz), vs_NORMAL0.xyz);
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat0.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat12)) + (-u_xlat0.xyz);
    u_xlat12 = (-_EnvReflectivity) + 1.0;
    u_xlat12 = u_xlat12 * 6.0;
    u_xlat10_0 = textureLod(unity_SpecCube0, u_xlat0.xyz, u_xlat12);
    u_xlat16_12 = u_xlat10_0.w + -1.0;
    u_xlat12 = unity_SpecCube0_HDR.w * u_xlat16_12 + 1.0;
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * unity_SpecCube0_HDR.y;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * unity_SpecCube0_HDR.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(u_xlat12);
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_EnvReflectStrength, _EnvReflectStrength, _EnvReflectStrength)) + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2

Constant Buffer "$Globals" (192 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 unity_WorldTransformParams at 112
  Vector4 _SpecColor at 128
  Vector4 _Color at 144
  Float _Shininess at 160
  Vector4 _EmissiveColor at 176
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    u_xlat0.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat0.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vs_TANGENT0.www;
    u_xlat0.xyz = u_xlat0.xyz * unity_WorldTransformParams.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
    u_xlat0.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9 = min(u_xlat9, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * vs_NORMAL0.xyz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat0.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat0.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat0.x);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vs_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED OCCLUSION_MAP_ENABLED 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1
Set 2D Texture "_NormalMap" to slot 2
Set 2D Texture "_EmissiveMap" to slot 3

Constant Buffer "$Globals" (196 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 unity_WorldTransformParams at 112
  Vector4 _SpecColor at 128
  Vector4 _Color at 144
  Float _Shininess at 160
  Vector4 _EmissiveColor at 176
  Float _OcclusionStrength at 192
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _OcclusionStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _OcclusionMap;
UNITY_LOCATION(2) uniform  sampler2D _NormalMap;
UNITY_LOCATION(3) uniform  sampler2D _EmissiveMap;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0.x + -1.0;
    u_xlat0.x = _OcclusionStrength * u_xlat16_0 + 1.0;
    SV_Target0.w = u_xlat0.x;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    u_xlat3.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat3.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TANGENT0.www;
    u_xlat3.xyz = u_xlat3.xyz * unity_WorldTransformParams.www;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.yyy;
    u_xlat3.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * vs_NORMAL0.xyz + u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    SV_Target2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat3.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat3.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat3.x);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat3.xyz = unity_SHC.xyz * u_xlat3.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vs_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1

Constant Buffer "$Globals" (176 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 _SpecColor at 112
  Vector4 _Color at 128
  Float _Cutoff at 144
  Float _Shininess at 148
  Vector4 _EmissiveColor at 160
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Cutoff;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat9 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = u_xlat9<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat0.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat0.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat0.x);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vs_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1

Constant Buffer "$Globals" (176 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 _SpecColor at 112
  Vector4 _Color at 128
  Float _Shininess at 144
  Vector4 _EmissiveColor at 160
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat0.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat0.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat0.x);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vs_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    SV_Target3.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: ENVRONMENT_REFLCTION_ENABLED UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set CUBE Texture "unity_SpecCube0" to slot 2

Constant Buffer "$Globals" (208 bytes) {
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_SHAr at 16
  Vector4 unity_SHAg at 32
  Vector4 unity_SHAb at 48
  Vector4 unity_SHBr at 64
  Vector4 unity_SHBg at 80
  Vector4 unity_SHBb at 96
  Vector4 unity_SHC at 112
  Vector4 unity_SpecCube0_HDR at 128
  Vector4 _SpecColor at 144
  Vector4 _Color at 160
  Float _Shininess at 176
  Float _EnvReflectivity at 180
  Float _EnvReflectStrength at 184
  Vector4 _EmissiveColor at 192
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _EnvReflectivity;
uniform 	float _EnvReflectStrength;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  samplerCube unity_SpecCube0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
float u_xlat16_12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot((-u_xlat0.xyz), vs_NORMAL0.xyz);
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat0.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat12)) + (-u_xlat0.xyz);
    u_xlat12 = (-_EnvReflectivity) + 1.0;
    u_xlat12 = u_xlat12 * 6.0;
    u_xlat10_0 = textureLod(unity_SpecCube0, u_xlat0.xyz, u_xlat12);
    u_xlat16_12 = u_xlat10_0.w + -1.0;
    u_xlat12 = unity_SpecCube0_HDR.w * u_xlat16_12 + 1.0;
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * unity_SpecCube0_HDR.y;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * unity_SpecCube0_HDR.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(u_xlat12);
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_EnvReflectStrength, _EnvReflectStrength, _EnvReflectStrength)) + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    SV_Target3.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2

Constant Buffer "$Globals" (192 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 unity_WorldTransformParams at 112
  Vector4 _SpecColor at 128
  Vector4 _Color at 144
  Float _Shininess at 160
  Vector4 _EmissiveColor at 176
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    u_xlat0.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat0.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vs_TANGENT0.www;
    u_xlat0.xyz = u_xlat0.xyz * unity_WorldTransformParams.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.yyy;
    u_xlat0.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9 = min(u_xlat9, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * vs_NORMAL0.xyz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat0.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat0.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat0.x);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vs_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    SV_Target3.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED OCCLUSION_MAP_ENABLED UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1
Set 2D Texture "_NormalMap" to slot 2
Set 2D Texture "_EmissiveMap" to slot 3

Constant Buffer "$Globals" (196 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 unity_WorldTransformParams at 112
  Vector4 _SpecColor at 128
  Vector4 _Color at 144
  Float _Shininess at 160
  Vector4 _EmissiveColor at 176
  Float _OcclusionStrength at 192
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _OcclusionStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _OcclusionMap;
UNITY_LOCATION(2) uniform  sampler2D _NormalMap;
UNITY_LOCATION(3) uniform  sampler2D _EmissiveMap;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
float u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0.x + -1.0;
    u_xlat0 = _OcclusionStrength * u_xlat16_0 + 1.0;
    SV_Target0.w = u_xlat0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    u_xlat3.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat3.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TANGENT0.www;
    u_xlat3.xyz = u_xlat3.xyz * unity_WorldTransformParams.www;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat1.x = u_xlat1.w * u_xlat1.x;
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.yyy;
    u_xlat3.xyz = u_xlat1.xxx * vs_TANGENT0.xyz + u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * vs_NORMAL0.xyz + u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    SV_Target2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat3.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat3.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat3.x);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat3.xyz = unity_SHC.xyz * u_xlat3.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vs_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz;
    SV_Target3.xyz = u_xlat3.xyz * vec3(u_xlat0) + u_xlat1.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1

Constant Buffer "$Globals" (176 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 _SpecColor at 112
  Vector4 _Color at 128
  Float _Cutoff at 144
  Float _Shininess at 148
  Vector4 _EmissiveColor at 160
}
Constant Buffer "$Globals" (208 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TANGENT0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_NORMAL0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Cutoff;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat9 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = u_xlat9<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat0.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat0.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat0.x);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = vs_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    SV_Target3.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1

Constant Buffer "$Globals" (176 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 _SpecColor at 112
  Vector4 _Color at 128
  Float _Shininess at 144
  Vector4 _EmissiveColor at 160
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: ENVRONMENT_REFLCTION_ENABLED VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set CUBE Texture "unity_SpecCube0" to slot 2

Constant Buffer "$Globals" (208 bytes) {
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_SHAr at 16
  Vector4 unity_SHAg at 32
  Vector4 unity_SHAb at 48
  Vector4 unity_SHBr at 64
  Vector4 unity_SHBg at 80
  Vector4 unity_SHBb at 96
  Vector4 unity_SHC at 112
  Vector4 unity_SpecCube0_HDR at 128
  Vector4 _SpecColor at 144
  Vector4 _Color at 160
  Float _Shininess at 176
  Float _EnvReflectivity at 180
  Float _EnvReflectStrength at 184
  Vector4 _EmissiveColor at 192
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _EnvReflectivity;
uniform 	float _EnvReflectStrength;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  samplerCube unity_SpecCube0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
float u_xlat16_12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot((-u_xlat1.xyz), vs_NORMAL0.xyz);
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat1.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat12)) + (-u_xlat1.xyz);
    u_xlat12 = (-_EnvReflectivity) + 1.0;
    u_xlat12 = u_xlat12 * 6.0;
    u_xlat10_1 = textureLod(unity_SpecCube0, u_xlat1.xyz, u_xlat12);
    u_xlat16_12 = u_xlat10_1.w + -1.0;
    u_xlat12 = unity_SpecCube0_HDR.w * u_xlat16_12 + 1.0;
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * unity_SpecCube0_HDR.y;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * unity_SpecCube0_HDR.x;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat12);
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_EnvReflectStrength, _EnvReflectStrength, _EnvReflectStrength)) + u_xlat0.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2

Constant Buffer "$Globals" (192 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 unity_WorldTransformParams at 112
  Vector4 _SpecColor at 128
  Vector4 _Color at 144
  Float _Shininess at 160
  Vector4 _EmissiveColor at 176
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    u_xlat1.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat1.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vs_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat2 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = u_xlat2.xxx * vs_TANGENT0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED OCCLUSION_MAP_ENABLED VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1
Set 2D Texture "_NormalMap" to slot 2
Set 2D Texture "_EmissiveMap" to slot 3

Constant Buffer "$Globals" (196 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 unity_WorldTransformParams at 112
  Vector4 _SpecColor at 128
  Vector4 _Color at 144
  Float _Shininess at 160
  Vector4 _EmissiveColor at 176
  Float _OcclusionStrength at 192
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _OcclusionStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _OcclusionMap;
UNITY_LOCATION(2) uniform  sampler2D _NormalMap;
UNITY_LOCATION(3) uniform  sampler2D _EmissiveMap;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0.x + -1.0;
    u_xlat0.w = _OcclusionStrength * u_xlat16_0 + 1.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _Color.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    u_xlat1.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat1.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vs_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = u_xlat2.xxx * vs_TANGENT0.xyz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat13 = min(u_xlat13, 1.0);
    u_xlat13 = (-u_xlat13) + 1.0;
    u_xlat13 = sqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat1.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat1.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat1.x);
    u_xlat2 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1

Constant Buffer "$Globals" (176 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 _SpecColor at 112
  Vector4 _Color at 128
  Float _Cutoff at 144
  Float _Shininess at 148
  Vector4 _EmissiveColor at 160
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Cutoff;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat12 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlatb12 = u_xlat12<0.0;
    if(((int(u_xlatb12) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: UNITY_HDR_ON VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1

Constant Buffer "$Globals" (176 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 _SpecColor at 112
  Vector4 _Color at 128
  Float _Shininess at 144
  Vector4 _EmissiveColor at 160
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    SV_Target3.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: ENVRONMENT_REFLCTION_ENABLED UNITY_HDR_ON VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1
Set CUBE Texture "unity_SpecCube0" to slot 2

Constant Buffer "$Globals" (208 bytes) {
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_SHAr at 16
  Vector4 unity_SHAg at 32
  Vector4 unity_SHAb at 48
  Vector4 unity_SHBr at 64
  Vector4 unity_SHBg at 80
  Vector4 unity_SHBb at 96
  Vector4 unity_SHC at 112
  Vector4 unity_SpecCube0_HDR at 128
  Vector4 _SpecColor at 144
  Vector4 _Color at 160
  Float _Shininess at 176
  Float _EnvReflectivity at 180
  Float _EnvReflectStrength at 184
  Vector4 _EmissiveColor at 192
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	float _EnvReflectivity;
uniform 	float _EnvReflectStrength;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
UNITY_LOCATION(2) uniform  samplerCube unity_SpecCube0;
in  vec3 vs_NORMAL0;
in  vec3 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
float u_xlat16_12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot((-u_xlat1.xyz), vs_NORMAL0.xyz);
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat1.xyz = vs_NORMAL0.xyz * (-vec3(u_xlat12)) + (-u_xlat1.xyz);
    u_xlat12 = (-_EnvReflectivity) + 1.0;
    u_xlat12 = u_xlat12 * 6.0;
    u_xlat10_1 = textureLod(unity_SpecCube0, u_xlat1.xyz, u_xlat12);
    u_xlat16_12 = u_xlat10_1.w + -1.0;
    u_xlat12 = unity_SpecCube0_HDR.w * u_xlat16_12 + 1.0;
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * unity_SpecCube0_HDR.y;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * unity_SpecCube0_HDR.x;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat12);
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_EnvReflectStrength, _EnvReflectStrength, _EnvReflectStrength)) + u_xlat0.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    SV_Target3.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED UNITY_HDR_ON VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_NormalMap" to slot 1
Set 2D Texture "_EmissiveMap" to slot 2

Constant Buffer "$Globals" (192 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 unity_WorldTransformParams at 112
  Vector4 _SpecColor at 128
  Vector4 _Color at 144
  Float _Shininess at 160
  Vector4 _EmissiveColor at 176
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _NormalMap;
UNITY_LOCATION(2) uniform  sampler2D _EmissiveMap;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    u_xlat1.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat1.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vs_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat2 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = u_xlat2.xxx * vs_TANGENT0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    SV_Target3.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: NORMAL_MAP_ENABLED OCCLUSION_MAP_ENABLED UNITY_HDR_ON VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1
Set 2D Texture "_NormalMap" to slot 2
Set 2D Texture "_EmissiveMap" to slot 3

Constant Buffer "$Globals" (196 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 unity_WorldTransformParams at 112
  Vector4 _SpecColor at 128
  Vector4 _Color at 144
  Float _Shininess at 160
  Vector4 _EmissiveColor at 176
  Float _OcclusionStrength at 192
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
uniform 	float _OcclusionStrength;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _OcclusionMap;
UNITY_LOCATION(2) uniform  sampler2D _NormalMap;
UNITY_LOCATION(3) uniform  sampler2D _EmissiveMap;
in  vec4 vs_TANGENT0;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0.x + -1.0;
    u_xlat0.w = _OcclusionStrength * u_xlat16_0 + 1.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat10_1.xyz * _Color.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    u_xlat1.xyz = vs_TANGENT0.yzx * vs_NORMAL0.zxy;
    u_xlat1.xyz = vs_NORMAL0.yzx * vs_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vs_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2 = texture(_NormalMap, vs_TEXCOORD1.xy);
    u_xlat2.x = u_xlat2.w * u_xlat2.x;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = u_xlat2.xxx * vs_TANGENT0.xyz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat13 = min(u_xlat13, 1.0);
    u_xlat13 = (-u_xlat13) + 1.0;
    u_xlat13 = sqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * vs_NORMAL0.xyz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat1.x = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat1.x = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat1.x);
    u_xlat2 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat0.www + u_xlat1.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: RENDER_MODE_CUTOUT UNITY_HDR_ON VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_EmissiveMap" to slot 1

Constant Buffer "$Globals" (176 bytes) {
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_SHBr at 48
  Vector4 unity_SHBg at 64
  Vector4 unity_SHBb at 80
  Vector4 unity_SHC at 96
  Vector4 _SpecColor at 112
  Vector4 _Color at 128
  Float _Cutoff at 144
  Float _Shininess at 148
  Vector4 _EmissiveColor at 160
}
Constant Buffer "$Globals" (400 bytes) {
  Matrix4x4 unity_ObjectToWorld at 192
  Matrix4x4 unity_WorldToObject at 256
  Matrix4x4 unity_MatrixVP at 320
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 _MainTex_ST at 384
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TANGENT0;
out vec3 vs_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TANGENT0.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TANGENT0.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Color;
uniform 	float _Cutoff;
uniform 	float _Shininess;
uniform 	vec4 _EmissiveColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _EmissiveMap;
in  vec3 vs_NORMAL0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat12 = u_xlat10_0.w * _Color.w + (-_Cutoff);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlatb12 = u_xlat12<0.0;
    if(((int(u_xlatb12) * int(0xffffffffu)))!=0){discard;}
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.xyz = _SpecColor.xyz;
    SV_Target1.w = _Shininess;
    SV_Target2.xyz = vs_NORMAL0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 0.0;
    u_xlat12 = vs_NORMAL0.y * vs_NORMAL0.y;
    u_xlat12 = vs_NORMAL0.x * vs_NORMAL0.x + (-u_xlat12);
    u_xlat1 = vs_NORMAL0.yzzx * vs_NORMAL0.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat2.xyz;
    u_xlat2.xyz = vs_NORMAL0.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat10_1 = texture(_EmissiveMap, vs_TEXCOORD1.xy);
    SV_Target3.xyz = u_xlat10_1.xyz * _EmissiveColor.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


 }
}
CustomEditor "PhongLigtingShaderGUI"
}