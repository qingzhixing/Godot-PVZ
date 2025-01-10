extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var seed_bank: Sprite2D = $SeedBank
@onready var coinbank: Sprite2D = $Coinbank

func on_camera_go_right_finished():
	animation_player.play("camera_go_left");
	pass

func on_camera_go_left_finished():
	seed_bank.visible = true;
	coinbank.visible = true;
	pass

func _ready() -> void:
	animation_player.play("camera_go_right");
	seed_bank.visible = false;
	coinbank.visible = false;
