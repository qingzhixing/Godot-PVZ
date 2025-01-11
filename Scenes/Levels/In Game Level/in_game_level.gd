extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func choose_seeds():
	
	animation_player.play("camera_go_left");

func on_camera_go_right_finished():
	choose_seeds();
	pass

func on_camera_go_left_finished():
	MusicController.play_stream(MusicController.music_Grasswalk)
	pass

func _ready() -> void:
	animation_player.play("camera_go_right");
