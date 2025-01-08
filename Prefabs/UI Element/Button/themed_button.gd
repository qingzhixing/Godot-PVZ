extends Button
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer

@export var tap_audio: Array[AudioStream];

@warning_ignore("unused_signal")
signal button_click_out_handler;

func on_pressed() -> void:
	if tap_audio == null || tap_audio.size() == 0:
		return ;
	audio_player.stream = tap_audio[randi() % tap_audio.size()];
	audio_player.play();
	emit_signal("button_click_out_handler")
	pass # Replace with function body.
