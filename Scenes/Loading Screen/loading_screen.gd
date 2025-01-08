extends Node2D


func _ready():
	MusicController.play_stream(MusicController.music_Crazy_Dave);

func on_button_clicked():
	SceneSwitcher.jump_to_scene("res://Scenes/Selector Screen/SelectorScreen.tscn")
	pass
