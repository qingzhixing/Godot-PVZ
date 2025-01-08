extends Node2D

@onready var level_trophy: Sprite2D = $"Level Window Button/Level Trophy"

@export var level_passed: bool = false;

func _ready() -> void:
	level_trophy.visible = level_passed;
