extends Node2D

@onready var level_trophy: Sprite2D = $"Level Window Button/Level Trophy"

@export var level_passed: bool = false;

@export var level_id: int;

signal level_window_button_pressed(level_id: int);

func _ready() -> void:
	level_trophy.visible = level_passed;


func on_level_window_button_pressed() -> void:
	emit_signal("level_window_button_pressed", level_id);
