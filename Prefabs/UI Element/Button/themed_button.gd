extends Button
@onready var sfx: AudioStreamPlayer2D = $SFX

@export var tap_audio: Array[AudioStream];

signal button_click_out_handler;

func on_pressed() -> void:
	if tap_audio == null || tap_audio.size() == 0:
		return ;
	sfx.stream = tap_audio[randi() % tap_audio.size()];
	sfx.play();
	button_click_out_handler.emit();
	pass # Replace with function body.
