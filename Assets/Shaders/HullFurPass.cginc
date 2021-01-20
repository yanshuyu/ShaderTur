#ifndef HULL_FUR_PASS
#define HULL_FUR_PASS

sampler2D _MainTex; 
half _Glossiness; 
half _Metallic; 
fixed4 _Color; 

sampler2D _FurNoise;
half _FurLen; 
half _FurRigidness;
half _FurDensity;
half _FurOcclusion;
half4 _Gravity; 

struct Input 
{ 
    float2 uv_MainTex;
    float stepPow3;
}; 
         
void vert(inout appdata_base v, out Input o) { 
    UNITY_INITIALIZE_OUTPUT(Input, o);
    o.stepPow3 = pow(FUR_STEP, 3);
    v.vertex.xyz += v.normal * _FurLen * o.stepPow3;
    half3 gravity = normalize(mul(unity_WorldToObject, _Gravity).xyz) * (1 - _FurRigidness) * _FurLen * o.stepPow3;
    v.vertex.xyz += gravity;
} 


void surf (Input IN, inout SurfaceOutputStandard o) 
{ 
    fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
    c.rgb = c.rgb - (1,1,1) * (1-IN.stepPow3) * _FurOcclusion;
    o.Albedo = c.rgb;
    o.Metallic = _Metallic;
    o.Smoothness = _Glossiness;

    float a = tex2D(_FurNoise, IN.uv_MainTex).r * c.a;
    a = clamp(a - IN.stepPow3 * (1 - _FurDensity), 0, 1);
    o.Alpha = a;
}

#endif