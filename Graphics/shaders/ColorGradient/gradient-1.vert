#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin; // cantonada minima de la capsa englobant 
uniform vec3 boundingBoxMax; // cantonada maxima de la capsa englobant

uniform vec4 red = vec4(1.0,0.0,0.0,1.0);
uniform vec4 yellow = vec4(1.0,1.0,0.0,1.0);
uniform vec4 green = vec4(0.0,1.0,0.0,1.0);
uniform vec4 cian = vec4(0.0,1.0,1.0,1.0);
uniform vec4 blue = vec4(0.0,0.0,1.0,1.0);
vec4 color2;
float porcentaje = 0.5;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    float altMedia = (boundingBoxMax.y - boundingBoxMin.y)/4;
	if(vertex.y <= altMedia+boundingBoxMin.y){
		porcentaje = (vertex.y-boundingBoxMin.y)/altMedia;
		color2 = mix(red, yellow, porcentaje);
	}
	else if(vertex.y <= altMedia*2+boundingBoxMin.y){
		porcentaje = (vertex.y-boundingBoxMin.y-altMedia)/altMedia;
		color2 = mix(yellow, green, porcentaje);
	}
	else if(vertex.y <= altMedia*3+boundingBoxMin.y){
		porcentaje = (vertex.y-boundingBoxMin.y-altMedia*2)/altMedia;
		color2 = mix(green, cian, porcentaje);
	}
	else if(vertex.y <= altMedia*4+boundingBoxMin.y){
		porcentaje = (vertex.y-boundingBoxMin.y-altMedia*3)/altMedia;	
		color2 = mix(cian, blue, porcentaje);
	}
    frontColor = color2;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
