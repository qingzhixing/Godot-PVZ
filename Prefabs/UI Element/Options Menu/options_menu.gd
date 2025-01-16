extends Node2D

var offset: Vector2 = Vector2(0, 0)
var is_dragging: bool = false

func bg_drag_start() -> void:
	is_dragging = true
	offset = position - get_global_mouse_position()

func bg_drag_stop() -> void:
	is_dragging = false

@warning_ignore("unused_parameter")
func _process(delta):
	if is_dragging:
		position = get_global_mouse_position() + offset
