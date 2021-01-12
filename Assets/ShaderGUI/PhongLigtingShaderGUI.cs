using UnityEngine;
using UnityEditor;

public class PhongLigtingShaderGUI : ShaderGUI
{
    static string PropertyName_AlbedoMap = "_AlbedoMap";
    static string PropertyName_MainColor = "_MainColor";
    static string PropertyName_NormalMap = "_NormalMap";
    static string PropertyName_SpecColor = "_SpecColor";
    static string PropertyName_Shininess = "_Shininess";
    static string PropertyName_EmissiveMap = "_EmissiveMap";
    static string PropertyName_EmissiveColor = "_EmissiveColor";

    static string KeyWord_UseNormalMap = "USE_NORMAL_MAP";

    Material activeMaterial;
    GUIContent GUILableForProperty(MaterialProperty prop, string tip = null) {
        return new GUIContent(prop.displayName, tip);
    }

    void SetKeyWordEnabled(string keyWord, bool enable) {
        if (enable)
            activeMaterial.EnableKeyword(keyWord);
        else 
            activeMaterial.DisableKeyword(keyWord);
    }

    public override void OnGUI(MaterialEditor editor, MaterialProperty[] properties) {
        activeMaterial = editor.target as Material;

        // albedo & main color
        MaterialProperty abledoMap = FindProperty(PropertyName_AlbedoMap, properties);
        editor.TexturePropertySingleLine(GUILableForProperty(abledoMap), abledoMap, FindProperty(PropertyName_MainColor, properties));

        // emission
        MaterialProperty emissiveMap = FindProperty(PropertyName_EmissiveMap, properties);
        editor.TexturePropertySingleLine(GUILableForProperty(emissiveMap), emissiveMap, FindProperty(PropertyName_EmissiveColor, properties));

        // normal map
        MaterialProperty normalMap = FindProperty(PropertyName_NormalMap, properties);
        EditorGUI.BeginChangeCheck();
        editor.TexturePropertySingleLine(GUILableForProperty(normalMap), normalMap);
        if (EditorGUI.EndChangeCheck()) {
            SetKeyWordEnabled(KeyWord_UseNormalMap, normalMap.textureValue);
        }
        

        // spec & shininess
        MaterialProperty specColor = FindProperty(PropertyName_SpecColor, properties);
        MaterialProperty shininess = FindProperty(PropertyName_Shininess, properties);
        editor.ShaderProperty(specColor, GUILableForProperty(specColor));
        editor.ShaderProperty(shininess, GUILableForProperty(shininess));

        editor.TextureScaleOffsetProperty(abledoMap);

    }
}
