extends Node2D

@onready var knob: TextureRect = $Knob

@export var min_x: float;
@export var max_x: float;

const knob_y: float = -15;

func knob_dragging(offset: Vector2) -> void:
	var unhandled_x = (offset + get_global_mouse_position()).x;
	var handled_x = min(max(unhandled_x, min_x), max_x);
	knob.position.x = handled_x;
