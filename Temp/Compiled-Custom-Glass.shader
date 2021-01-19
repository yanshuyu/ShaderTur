// Compiled shader for PC, Mac & Linux Standalone

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/Glass" {
Properties {
 _MainTex ("Main Texture", 2D) = "white" { }
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _BumpTex ("Bump Texture", 2D) = "bump" { }
 _DistoreAmount ("Distore Amount", Range(0.000000,1.000000)) = 0.500000
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL 
Local Keywords: <none>
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH 
Local Keywords: <none>
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL SHADOWS_SCREEN 
Local Keywords: <none>
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN 
Local Keywords: <none>
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDADD" "RenderType"="Opaque" }
  ZWrite Off
  Blend One One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: POINT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: POINT_COOKIE 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: POINT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: SPOT 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: POINT_COOKIE 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: DIRECTIONAL_COOKIE 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PREPASSBASE" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (192 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD0.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    output.SV_Target0.xyz = fma(input.TEXCOORD0.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target0.w = 0.0;
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Constant Buffer "$Globals" (192 bytes) {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 0.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PREPASSFINAL" "RenderType"="Opaque" }
  ZWrite Off
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: LIGHTPROBE_SH 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: LIGHTPROBE_SH UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: LIGHTPROBE_SH 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: LIGHTPROBE_SH UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


 }
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="DEFERRED" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: LIGHTPROBE_SH 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: LIGHTPROBE_SH UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: LIGHTPROBE_SH 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


//////////////////////////////////////////////////////
Global Keywords: LIGHTPROBE_SH UNITY_HDR_ON 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
// Compile errors generating this shader.

-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:


 }
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: SHADOWS_DEPTH 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat6;
    float u_xlat9;
    bool u_xlatb9;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat6);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat6);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    output.TEXCOORD1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: SHADOWS_CUBE 
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat9;
    bool u_xlatb9;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    output.TEXCOORD1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Global Keywords: SHADOWS_DEPTH 
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
out vec3 vs_TEXCOORD1;
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
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
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
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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


//////////////////////////////////////////////////////
Global Keywords: SHADOWS_CUBE 
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
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
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
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
 GrabPass {
 }
}
}