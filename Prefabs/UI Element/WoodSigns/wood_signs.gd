extends Node2D
@onready var label: Label = $Label

@export var lableText: String = "QingzhiStar!"

@warning_ignore("unused_signal")
signal change_user_pressed;

@warning_ignore("unused_signal")
signal zombatar_pressed;

var text_need_update = false;

func set_label_text(text: String) -> void:
	label.text = text

func _ready() -> void:
	label.text = lableText

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if text_need_update:
		label.text = lableText

func on_change_user_pressed() -> void:
	emit_signal("change_user_pressed")
	pass # Replace with function body.

func on_zombatar_pressed() -> void:
	emit_signal("zombatar_pressed")
	pass # Replace with function body.
