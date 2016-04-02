#version 330 core

in vec4 frontColor;
in vec3 N;


out vec4 fragColor;

void main()
{
    vec3 N3 = normalize(N);
    fragColor = frontColor * N3.z;
}
