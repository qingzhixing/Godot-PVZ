extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var in_game_ui: CanvasLayer = $"In Game UI"
@onready var seed_chooser_ui: CanvasLayer = $"Seed Chooser UI"

func choose_seeds():
	seed_chooser_ui.visible = true;

func on_seed_chosen():
	seed_chooser_ui.visible = false;
	animation_player.play("camera_go_left");

func on_camera_go_right_finished():
	choose_seeds();
	pass

func on_camera_go_left_finished():
	in_game_ui.visible = true;
	MusicController.play_stream(MusicController.music_Grasswalk)
	pass

func _ready() -> void:
	seed_chooser_ui.visible = false;
	in_game_ui.visible = false;
	animation_player.play("camera_go_right");


func on_menu_button_clicked() -> void:
	SceneSwitcher.jump_to_scene("res://Scenes/Selector Screen/SelectorScreen.tscn");
