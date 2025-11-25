shader_type canvas_item;
uniform float shake_multiplier = 40.0;
uniform bool do_quantize;
uniform float quantize_to : hint_range(0, 2, 0.1) = 1;

void vertex() {
	// Called for every vertex the material is visible on.
	VERTEX.x += sin(TIME * shake_multiplier);
	if (do_quantize) {
		VERTEX = round(VERTEX / quantize_to);
		VERTEX *= quantize_to;
	}
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
