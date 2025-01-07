shader_type canvas_item;

uniform sampler2D greyTexture;

void fragment() {
	// set grey value to alpha
	COLOR.a = texture(greyTexture, UV).r;
}
