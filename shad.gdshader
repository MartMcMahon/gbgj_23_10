shader_type canvas_item;

void fragment() {
	vec4 curr_color = texture(TEXTURE,UV);
	COLOR = vec4(SCREEN_UV.x, SCREEN_UV.y, 1, 1);
}
