extends Control

# index 0=>up 1=>down
@onready var textures: Control = $Textures
@onready var active_button: CustomTextureButton = $"Active Button"

signal button_clicked;

@export var hover_audio: AudioStream;
@export var click_audio: AudioStream;
@export var pressed_position_delta: Vector2 = Vector2(1, 1);
var in_animation: bool = false;

func _ready() -> void:
	if hover_audio:
		active_button.hover_audio = hover_audio
	if click_audio:
		active_button.click_audio = click_audio

func on_button_down() -> void:
	if in_animation:
		return ;
	in_animation = true;
	position += pressed_position_delta;
	var flippables = textures.get_children(false) as Array[FlippableTextureRect];
	for flippable in flippables:
		flippable.switch_to(1);

func on_button_up() -> void:
	in_animation = false;
	position -= pressed_position_delta;
	var flippables = textures.get_children(false) as Array[FlippableTextureRect];
	for flippable in flippables:
		flippable.switch_to(0);

func on_active_button_pressed() -> void:
	button_clicked.emit();
