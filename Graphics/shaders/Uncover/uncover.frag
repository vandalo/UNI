#version 330 core

in vec4 frontColor;
in vec3 NDC;
out vec4 fragColor;

uniform float time;
uniform float animation = 1.0;

void main()
{
	if(time/animation >= NDC.x+1) fragColor = frontColor;
    else discard;
}
