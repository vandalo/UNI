#version 330 core

in vec3 nnormal;
in vec3 vvertex;
out vec4 fragColor;

uniform mat3 normalMatrix;

uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space

uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

vec4 Phong(vec3 N, vec3 L, vec3 V){		    
	float NL = max(0.0, dot(N,L));
	vec3 R = normalize(2*dot(N,L)*N-L);		
	float RV2 = pow(max(0.0, dot(R,V)),matShininess);
	return (matAmbient*lightAmbient + matDiffuse*lightDiffuse*NL + matSpecular*lightSpecular*RV2);
}


void main()
{
	vec3 N = normalize(normalMatrix * nnormal);
    vec3 V = normalize(-vvertex);//vec3(0.0f,0.0f,1.0f);	
    vec3 L = normalize(lightPosition.xyz - vvertex);
    fragColor = Phong(N, L, V);
}
