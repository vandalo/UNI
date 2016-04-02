#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;

uniform mat4 modelMatrixInverse;
uniform mat4 viewMatrixInverse;
uniform mat4 projectionMatrixInverse;
uniform mat4 modelViewMatrixInverse;
uniform mat4 modelViewProjectionMatrixInverse;

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
	vec3 N = normalize(normalMatrix * normal);
	vec3 P = (modelViewMatrix * vec4(vertex.xyz, 1.0)).xyz;
    vec3 V = normalize(-P);//vec3(0.0f,0.0f,1.0f);	
    vec3 L = normalize(lightPosition.xyz - P);
	
	frontColor = Phong(N,L,V);
    

    //frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}

    

	
