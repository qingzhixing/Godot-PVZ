extends Node2D

func _ready() -> void:
	MusicController.play_stream(MusicController.music_ChooseYourSeeds);


func on_back_to_menu_button_pressed() -> void:
	SceneSwitcher.jump_to_scene("res://Scenes/Selector Screen/SelectorScreen.tscn")


func on_level_window_button_pressed(level_id: int) -> void:
	print("Level " + str(level_id) + " selected");
	SceneSwitcher.current_level = level_id;
	SceneSwitcher.jump_to_scene("res://Scenes/Levels/In Game Level/In Game Level.tscn")
	pass # Replace with function body.
