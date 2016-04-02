#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec3 nnormal;
out vec3 vvertex;

uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;


void main()
{	

	vvertex = (modelViewMatrix * vec4(vertex, 1.0)).xyz;
	nnormal = normal;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}

    

	

