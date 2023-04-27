shader_type canvas_item;

uniform sampler2D dissolve_pattern;
uniform float dissolve_state : hint_range(0.0, 1.0) = 0;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	float pattern_val = texture(dissolve_pattern, UV).r;
	COLOR.a *= step(dissolve_state, pattern_val);
}
