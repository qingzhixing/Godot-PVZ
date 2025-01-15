extends Control

# index 0=>up 1=>down
@onready var left: FlippableTextureRect = $Textures/Left
@onready var mid: FlippableTextureRect = $Textures/Mid
@onready var right: FlippableTextureRect = $Textures/Right

signal button_clicked;

@export var pressed_position_delta: Vector2 = Vector2(1, 1);
var in_animation: bool = false;

func on_button_down() -> void:
	if in_animation:
		return ;
	in_animation = true;
	position += pressed_position_delta;
	left.switch_to(1);
	mid.switch_to(1);
	right.switch_to(1);

func on_button_up() -> void:
	in_animation = false;
	position -= pressed_position_delta;
	left.switch_to(0);
	mid.switch_to(0);
	right.switch_to(0);

func on_active_button_pressed() -> void:
	button_clicked.emit();
