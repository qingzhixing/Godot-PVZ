extends Control

@warning_ignore("unused_signal")
signal button_clicked;

@export var pressed_position_delta: Vector2 = Vector2(1, 1);
var in_animation: bool = false;

func on_button_down() -> void:
	if in_animation:
		return ;
	in_animation = true;
	position += pressed_position_delta;


func on_button_up() -> void:
	in_animation = false;
	position -= pressed_position_delta;

func on_active_button_pressed() -> void:
	emit_signal("button_clicked");
