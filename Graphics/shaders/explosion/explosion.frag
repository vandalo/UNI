#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D explosion;
uniform float time;

uniform float amplitude = 0.1;
uniform float freq = 1; //Hz



void main()
{
	vec2 newVtexCoord;
	float ofsetS;
	float ofsetT;
	float slice = 1/30.0;
	float frame = mod(floor(time/slice),48);
	float s = vtexCoord.s/8.0;
	float t = vtexCoord.t/6.0;

	ofsetS = mod(frame,8);
	if(frame <= 7)ofsetT = 5/6.0;
	else if(frame <= 15)ofsetT = 4/6.0;	
	else if(frame <= 23)ofsetT = 4/6.0;	
	
	newVtexCoord = vec2(s+ofsetS, t+ofsetT);	
    fragColor = texture(explosion, newVtexCoord);
}
