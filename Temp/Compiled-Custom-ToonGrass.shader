// Compiled shader for custom platforms

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/ToonGrass" {
Properties {
 _TipColor ("Tip Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _BottomColor ("Bottom Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _WidthRange ("Min/Max Width", Vector) = (0.500000,1.000000,0.000000,0.000000)
 _HeightRange ("Min/Max Height", Vector) = (0.500000,1.000000,0.000000,0.000000)
 _WidthRandomness ("Width Randomness", Range(0.000000,1.000000)) = 0.500000
 _HeightRandomness ("Height Randomness", Range(0.000000,1.000000)) = 0.500000
 _FacingRandomness ("Facing Randomness", Range(0.000000,1.000000)) = 0.500000
 _BendRandomness ("Bend Randomness", Range(0.000000,1.000000)) = 0.500000
 _WindFlowMap ("Wind Flow", 2D) = "black" { }
 _WindFrequence ("Wind Frequence", Range(0.000000,1.000000)) = 0.500000
 _windStren ("Wind Strength", Range(0.000000,1.000000)) = 1.000000
}
SubShader { 
 Pass {
  Tags { "LIGHTMODE"="FORWARDBASE" }
  Cull Off
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

-- Hardware tier variant: Tier 1
-- Geometry shader for "metal":
// Compile errors generating this shader.

//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_WindFlowMap" to slot 0

Constant Buffer "$Globals" (32 bytes) {
  Vector4 _TipColor at 0
  Vector4 _BottomColor at 16
}
Constant Buffer "$Globals" (216 bytes) {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 96
  Vector4 _Time at 0
  Vector4 unity_WorldTransformParams at 80
  Vector2 _WidthRange at 160
  Vector2 _HeightRange at 168
  Float _WidthRandomness at 176
  Float _HeightRandomness at 180
  Float _FacingRandomness at 184
  Float _BendRandomness at 188
  Vector4 _WindFlowMap_ST at 192
  Float _WindFrequence at 208
  Float _windStren at 212
}

Shader Disassembly:
#ifdef VERTEX
#version 410
#extension GL_ARB_explicit_attrib_location : require

in  vec4 in_POSITION0;
in  vec4 in_TANGNET0;
in  vec3 in_NORMAL0;
layout(location = 0) out vec4 vs_TANGNET0;
layout(location = 1) out vec3 vs_NORMAL0;
void main()
{
    gl_Position = in_POSITION0;
    vs_TANGNET0 = in_TANGNET0;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _TipColor;
uniform 	vec4 _BottomColor;
layout(location = 0) in  vec2 gs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = _TipColor + (-_BottomColor);
    SV_Target0 = gs_TEXCOORD0.yyyy * u_xlat0 + _BottomColor;
    return;
}

#endif
#ifdef GEOMETRY
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec2 _WidthRange;
uniform 	vec2 _HeightRange;
uniform 	float _WidthRandomness;
uniform 	float _HeightRandomness;
uniform 	float _FacingRandomness;
uniform 	float _BendRandomness;
uniform 	vec4 _WindFlowMap_ST;
uniform 	float _WindFrequence;
uniform 	float _windStren;
UNITY_LOCATION(0) uniform  sampler2D _WindFlowMap;
layout(location = 0) in  vec4 vs_TANGNET0 [3];
layout(location = 1) in  vec3 vs_NORMAL0 [3];
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
vec4 u_xlat13;
vec4 u_xlat14;
vec2 u_xlat15;
vec3 u_xlat17;
vec3 u_xlat18;
vec3 u_xlat19;
vec3 u_xlat20;
float u_xlat32;
float u_xlat45;
float u_xlat46;
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out vec2 gs_TEXCOORD0;
layout(max_vertices = 3) out;
void main()
{
    u_xlat0.x = dot(gl_in[0].gl_Position.xyz, vec3(12.9898005, 78.2330017, 53.5390015));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WidthRandomness;
    u_xlat15.xy = (-vec2(_WidthRange.x, _HeightRange.x)) + vec2(_WidthRange.y, _HeightRange.y);
    u_xlat0.x = u_xlat0.x * u_xlat15.x + _WidthRange.x;
    u_xlat1.xyz = gl_in[1].gl_Position.xyz + gl_in[0].gl_Position.xyz;
    u_xlat1.xyz = u_xlat1.xyz + gl_in[2].gl_Position.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
    u_xlat3.xy = u_xlat2.xz * _WindFlowMap_ST.xy + _WindFlowMap_ST.zw;
    u_xlat45 = dot(u_xlat2.xyz, vec3(12.9898005, 78.2330017, 53.5390015));
    u_xlat0.w = sin(u_xlat45);
    u_xlat0.xyw = u_xlat0.xxw * vec3(-0.5, 0.5, 43758.5469);
    u_xlat45 = fract(u_xlat0.w);
    u_xlat45 = u_xlat45 + -0.5;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = u_xlat45 * _BendRandomness;
    u_xlat2.x = sin(u_xlat45);
    u_xlat4.x = cos(u_xlat45);
    u_xlat17.xy = _Time.yy * vec2(_WindFrequence) + u_xlat3.xy;
    u_xlat17.xy = textureLod(_WindFlowMap, u_xlat17.xy, 0.0).xy;
    u_xlat17.xy = u_xlat17.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat17.xy = u_xlat17.xy * vec2(vec2(_windStren, _windStren));
    u_xlat45 = dot(u_xlat17.xy, u_xlat17.xy);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat17.xz = vec2(u_xlat45) * u_xlat17.xy;
    u_xlat45 = u_xlat17.y * 3.14159274;
    u_xlat3.x = sin(u_xlat45);
    u_xlat5.x = cos(u_xlat45);
    u_xlat45 = u_xlat17.x * u_xlat17.x;
    u_xlat46 = (-u_xlat5.x) + 1.0;
    u_xlat6.x = u_xlat45 * u_xlat46 + u_xlat5.x;
    u_xlat45 = u_xlat17.z * u_xlat46;
    u_xlat46 = dot(gl_in[2].gl_Position.xyz, vec3(12.9898005, 78.2330017, 53.5390015));
    u_xlat46 = sin(u_xlat46);
    u_xlat46 = u_xlat46 * 43758.5469;
    u_xlat46 = fract(u_xlat46);
    u_xlat46 = u_xlat46 * 6.28318548;
    u_xlat46 = u_xlat46 * _FacingRandomness;
    u_xlat7.x = sin(u_xlat46);
    u_xlat8.x = cos(u_xlat46);
    u_xlat46 = vs_NORMAL0[0].z * vs_NORMAL0[0].z;
    u_xlat32 = (-u_xlat8.x) + 1.0;
    u_xlat9.w = u_xlat46 * u_xlat32 + u_xlat8.x;
    u_xlat10 = vec4(u_xlat32) * vs_NORMAL0[0].xxxy;
    u_xlat46 = (-u_xlat4.x) + 1.0;
    u_xlat18.xyz = vs_TANGNET0[0].xyz * vs_NORMAL0[0].yzx;
    u_xlat18.xyz = vs_NORMAL0[0].xyz * vs_TANGNET0[0].yzx + (-u_xlat18.xyz);
    u_xlat18.xyz = u_xlat18.xyz * vs_TANGNET0[0].www;
    u_xlat18.xyz = u_xlat18.xyz * unity_WorldTransformParams.www;
    u_xlat32 = u_xlat18.x * u_xlat18.x;
    u_xlat11.w = u_xlat32 * u_xlat46 + u_xlat4.x;
    u_xlat12 = vec4(u_xlat46) * u_xlat18.yyyz;
    u_xlat19.xyz = u_xlat2.xxx * u_xlat18.xyz;
    u_xlat13.xy = u_xlat12.xw * u_xlat18.yz + u_xlat4.xx;
    u_xlat11.z = u_xlat12.w * u_xlat18.x + (-u_xlat19.y);
    u_xlat11.xy = u_xlat12.zy * u_xlat18.xz + u_xlat19.zx;
    u_xlat20.xyz = u_xlat7.xxx * vs_NORMAL0[0].zxy;
    u_xlat7.xy = u_xlat10.xw * vs_NORMAL0[0].xy + u_xlat8.xx;
    u_xlat9.z = u_xlat10.w * vs_NORMAL0[0].z + u_xlat20.y;
    u_xlat9.xy = u_xlat10.yz * vs_NORMAL0[0].yz + (-u_xlat20.xz);
    u_xlat8.z = dot(u_xlat9.yzw, u_xlat11.xzw);
    u_xlat14.z = u_xlat12.w * u_xlat18.x + u_xlat19.y;
    u_xlat14.xy = u_xlat12.yz * u_xlat18.zx + (-u_xlat19.xz);
    u_xlat14.w = u_xlat13.y;
    u_xlat8.y = dot(u_xlat9.ywz, u_xlat14.xzw);
    u_xlat4.z = u_xlat17.x * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat17.z + u_xlat5.x;
    u_xlat6.yz = u_xlat17.xz * u_xlat3.xx;
    u_xlat2.z = u_xlat5.x;
    u_xlat6.w = u_xlat4.z;
    u_xlat13.z = u_xlat11.y;
    u_xlat13.w = u_xlat14.y;
    u_xlat8.x = dot(u_xlat9.yzw, u_xlat13.xzw);
    u_xlat7.z = u_xlat9.x;
    u_xlat3.y = dot(u_xlat8.yzx, u_xlat6.xzw);
    u_xlat4.w = (-u_xlat6.y);
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat4.xzw);
    u_xlat2.xy = u_xlat6.yz * vec2(1.0, -1.0);
    u_xlat3.z = dot(u_xlat8.xyz, u_xlat2.xyz);
    u_xlat45 = dot(u_xlat3.xyz, vs_TANGNET0[0].xyz);
    u_xlat46 = dot(u_xlat3.xyz, vs_NORMAL0[0].xyz);
    u_xlat3.xw = u_xlat0.xy * vec2(u_xlat45);
    u_xlat8.w = u_xlat3.x;
    u_xlat9.z = u_xlat10.w * vs_NORMAL0[0].z + (-u_xlat20.y);
    u_xlat9.xy = u_xlat10.zy * vs_NORMAL0[0].zy + u_xlat20.zx;
    u_xlat9.w = u_xlat7.y;
    u_xlat5.z = dot(u_xlat9.ywz, u_xlat11.xzw);
    u_xlat5.y = dot(u_xlat9.yzw, u_xlat14.xzw);
    u_xlat5.x = dot(u_xlat9.ywz, u_xlat13.xzw);
    u_xlat7.w = u_xlat9.x;
    u_xlat9.y = dot(u_xlat5.yzx, u_xlat6.xzw);
    u_xlat9.x = dot(u_xlat5.xyz, u_xlat4.xzw);
    u_xlat9.z = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat45 = dot(u_xlat9.xyz, vs_TANGNET0[0].xyz);
    u_xlat2.w = dot(u_xlat9.xyz, vs_NORMAL0[0].xyz);
    u_xlat3.xy = u_xlat0.xy * vec2(u_xlat45);
    u_xlat8.z = u_xlat3.x;
    u_xlat5.z = dot(u_xlat7.xzw, u_xlat11.xzw);
    u_xlat5.y = dot(u_xlat7.xwz, u_xlat14.xzw);
    u_xlat5.x = dot(u_xlat7.xzw, u_xlat13.xzw);
    u_xlat4.x = dot(u_xlat5.xyz, u_xlat4.xzw);
    u_xlat4.y = dot(u_xlat5.yzx, u_xlat6.xzw);
    u_xlat4.z = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat45 = dot(u_xlat4.xyz, vs_TANGNET0[0].xyz);
    u_xlat2.x = dot(u_xlat4.xyz, vs_NORMAL0[0].xyz);
    u_xlat8.xy = u_xlat0.xy * vec2(u_xlat45);
    u_xlat0.xyw = u_xlat1.xyz * vec3(0.333333343, 0.333333343, 0.333333343) + u_xlat8.xzw;
    u_xlat3.z = u_xlat8.y;
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.333333343, 0.333333343, 0.333333343) + u_xlat3.zyw;
    u_xlat4 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.wwww + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat5 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat5;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat4.wwww + u_xlat5;
    gl_Position = u_xlat4;
    gs_TEXCOORD0.xy = vec2(0.0, 0.0);
    EmitVertex();
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat4 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
    gl_Position = u_xlat3;
    gs_TEXCOORD0.xy = vec2(0.0, 0.0);
    EmitVertex();
    u_xlat0.x = dot(gl_in[1].gl_Position.xyz, vec3(12.9898005, 78.2330017, 53.5390015));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _HeightRandomness;
    u_xlat0.x = u_xlat0.x * u_xlat15.y + _HeightRange.xxxy.z;
    u_xlat2.xy = u_xlat0.xx * u_xlat2.xw;
    u_xlat2.z = u_xlat0.x * u_xlat46;
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.333333343, 0.333333343, 0.333333343) + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    gs_TEXCOORD0.xy = vec2(1.0, 1.0);
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
}
}