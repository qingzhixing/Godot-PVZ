extends Node2D

func _ready() -> void:
	MusicController.play_stream(MusicController.music_ChooseYourSeeds);


func on_back_to_menu_button_pressed() -> void:
	SceneSwitcher.jump_to_scene("res://Scenes/Selector Screen/SelectorScreen.tscn")
