extends Node2D

class_name CustomSlider

@onready var knob: TextureButton = $Knob

@export var min_x: float;
@export var max_x: float;

const knob_y: float = -15;
var offset: Vector2 = Vector2(0, 0);
var is_dragging: bool = false;

func knob_drag_start():
	is_dragging = true;
	offset = knob.position - get_global_mouse_position();

func knob_drag_stop():
	is_dragging = false;

func knob_dragging() -> void:
	var unhandled_x = (offset + get_global_mouse_position()).x;
	var handled_x = min(max(unhandled_x, min_x), max_x);
	knob.position.x = handled_x;

@warning_ignore("unused_parameter")
func _process(delta):
	if is_dragging:
		knob_dragging();
