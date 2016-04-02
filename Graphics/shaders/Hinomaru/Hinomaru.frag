#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform vec4 red = vec4(1.0,0.,0.,1.);
uniform vec4 white = vec4(1.,1.,1.,1.);
uniform vec2 center = vec2(0.5,0.5);
uniform float r = 0.2;

void main()
{
	float d = distance(vtexCoord, center);
	if (step(r,d) == 1. ) fragColor = white;
	else fragColor = red;
	//float width = 0.7*length(vec2(dFdx(d),dFdy(d)));
	//fragColor = mix(red, white, smoothstep(r-width,r+width,d));
    //fragColor = vec4(smoothstep(r-0.5, r+0.5, 0.5));
}
