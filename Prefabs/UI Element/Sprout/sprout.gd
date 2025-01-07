extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("Hide");

func sprout():
	animation_player.play("Sprout");
