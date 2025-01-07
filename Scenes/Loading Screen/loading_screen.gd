extends Node2D

@onready var switch_timer: Timer = $SwitchTimer

func switch():
	# switch to the next scene
	get_tree().change_scene_to_file("res://Scenes/Selector Screen/SelectorScreen.tscn")

func on_button_clicked():
	print("Button clicked, switching to Selector Screen")
	switch_timer.start();
	pass
