extends TextureButton

var isDragging: bool = false
var offset = Vector2.ZERO

@export var has_custom_dragging_handler: bool = false
@export var bitmap_mask_image: Image = null;

signal drag_start;
signal drag_stop;

@warning_ignore("unused_parameter")
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var button_event = event as InputEventMouseButton
		if button_event.button_index == MOUSE_BUTTON_LEFT:
			if button_event.is_pressed():
				if isDragging == false:
					drag_start.emit()
				isDragging = true
				offset = position - get_global_mouse_position()
			else:
				if isDragging == true:
					drag_stop.emit()
				isDragging = false
			# 阻断事件传播
			accept_event()


@warning_ignore("unused_parameter")
func _process(delta):
	if isDragging:
		if !has_custom_dragging_handler:
			position = get_global_mouse_position() + offset

func _ready():
	if bitmap_mask_image != null:
		texture_click_mask = BitMap.new()
		texture_click_mask.create_from_image_alpha(bitmap_mask_image)
