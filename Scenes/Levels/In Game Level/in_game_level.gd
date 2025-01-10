extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var seed_bank: Sprite2D = $SeedBank
@onready var coinbank: Sprite2D = $Coinbank
@onready var level_info: Label = $"Level Info"
@onready var shovel: Node2D = $Shovel

func on_camera_go_right_finished():
	animation_player.play("camera_go_left");
	pass

func on_camera_go_left_finished():
	MusicController.play_stream(MusicController.music_Grasswalk)
	seed_bank.visible = true;
	coinbank.visible = true;
	shovel.visible = true;
	pass

func _ready() -> void:
	animation_player.play("camera_go_right");
	seed_bank.visible = false;
	coinbank.visible = false;
	shovel.visible = false;
	level_info.text = "Level: " + str(SceneSwitcher.current_level);
