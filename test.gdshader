shader_type spatial;

uniform float freq : hint_range(0.0, 1.0, 0.1);
uniform float xAmp : hint_range(0.0, 1.0, 0.1);
void vertex(){
	VERTEX.y += sin(VERTEX.x * freq + TIME) * xAmp;
}

void fragment() {
	// Place fragment code here.
	
}
