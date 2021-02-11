using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class HealthBarUI : MonoBehaviour
{
    public Transform cameraTransform;
    
    [Range(0, 1)] 
    public float health = 1;

    private MaterialPropertyBlock _mtlPropBlock;
    
    // Update is called once per frame
    void Update() {
        Vector3 forward = (transform.position - cameraTransform.position).normalized;
        transform.rotation = Quaternion.LookRotation(forward, Vector3.up);

        if (_mtlPropBlock == null) {
            _mtlPropBlock = new MaterialPropertyBlock();
        }
        _mtlPropBlock.SetFloat("_Fill", health);
        GetComponent<Renderer>().SetPropertyBlock(_mtlPropBlock);
    }
}
