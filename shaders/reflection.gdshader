shader_type canvas_item;

uniform int hFrames = 1; //Number of horizontal frames in the Texture
uniform int vFrames = 1; //Number of vertical frames in the Texture

group_uniforms Displacement;
uniform bool enableMovement = true;
uniform int displacementPixels = 1; // Number of pixels to displace

uniform float timeGap : hint_range(0.0, 1.0, 0.01) = 0.4; // Time in seconds that Left side movement will wait to move

uniform float speed = 1.25; // Movement speed


void vertex(){

}

void fragment() {

}