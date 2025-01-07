extends Node2D
@onready var switch_timer: Timer = $SwitchTimer

func on_adventure_button_pressed() -> void:
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

func quit_game() -> void:
	get_tree().quit()

func on_quit_pressed() -> void:
	switch_timer.connect("timeout", quit_game);
	print("Quitting game in 0.3 seconds...")
	switch_timer.start()
	pass # Replace with function body.


func on_shop_pressed() -> void:
	pass # Replace with function body.
