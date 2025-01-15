extends Control

var isDragging: bool = false
var offset = Vector2.ZERO

@export var has_custom_dragging_handler: bool = false

signal dragging(offset: Vector2);

@warning_ignore("unused_parameter")
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var button_event = event as InputEventMouseButton
		if button_event.button_index == MOUSE_BUTTON_LEFT:
			if button_event.is_pressed():
				isDragging = true
				offset = position - get_global_mouse_position()
			else:
				isDragging = false
			# 阻断事件传播
			accept_event()


@warning_ignore("unused_parameter")
func _process(delta):
	if isDragging:
		if has_custom_dragging_handler:
			dragging.emit(offset)
		else:
			position = get_global_mouse_position() + offset
