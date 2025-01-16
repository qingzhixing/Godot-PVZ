extends Node2D

class_name CustomSlider

@onready var knob: TextureButton = $Knob

@export var min_x: float;
@export var max_x: float;

const knob_y: float = -15;
var offset: Vector2 = Vector2(0, 0);
var is_dragging: bool = false;

signal value_changed(value: float);
signal drag_start;
signal drag_stop;

func get_value() -> float:
	return (knob.position.x - min_x) / (max_x - min_x);

func knob_drag_start():
	is_dragging = true;
	drag_start.emit();
	offset = knob.position - get_global_mouse_position();

func knob_drag_stop():
	drag_stop.emit();
	is_dragging = false;

func knob_dragging() -> void:
	# print("Slider Dragging... Value: " + str(get_value()))
	var unhandled_x = (offset + get_global_mouse_position()).x;
	var handled_x = min(max(unhandled_x, min_x), max_x);
	knob.position.x = handled_x;
	value_changed.emit(get_value());

@warning_ignore("unused_parameter")
func _process(delta):
	if is_dragging:
		knob_dragging();
