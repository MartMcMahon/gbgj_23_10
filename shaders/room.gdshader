shader_type canvas_item;

uniform float dist_to_player = 10.0;

void fragment() {
	COLOR = vec4(SCREEN_UV.x, SCREEN_UV.y, sin(dist_to_player), 1);
}
