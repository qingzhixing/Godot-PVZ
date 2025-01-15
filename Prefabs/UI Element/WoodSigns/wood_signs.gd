extends Node2D
@onready var label: Label = $Label

@export var lableText: String = "QingzhiStar!"

signal change_user_pressed;
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
	change_user_pressed.emit()
	pass # Replace with function body.

func on_zombatar_pressed() -> void:
	zombatar_pressed.emit()
	pass # Replace with function body.
