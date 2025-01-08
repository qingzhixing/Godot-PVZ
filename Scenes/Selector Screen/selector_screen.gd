extends Node2D

func _ready():
	MusicController.play_stream(MusicController.music_Crazy_Dave);
	
func on_adventure_button_pressed() -> void:
	SceneSwitcher.jump_to_scene("res://Scenes/Level Selection Screen/Level Selection Screen.tscn");
	pass # Replace with function body.


func on_mini_games_button_pressed() -> void:
	pass # Replace with function body.


func on_challenges_button_pressed() -> void:
	pass # Replace with function body.


func on_survival_button_pressed() -> void:
	pass # Replace with function body.


func on_almanac_pressed() -> void:
	pass # Replace with function body.


func on_zen_garden_pressed() -> void:
	pass # Replace with function body.

func on_quit_pressed() -> void:
	print("Quitting...")
	SceneSwitcher.delay_call(get_tree().quit)
	pass # Replace with function body.


func on_shop_pressed() -> void:
	pass # Replace with function body.
