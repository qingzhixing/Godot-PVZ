extends CheckBox

@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer

@warning_ignore("unused_parameter")
func on_toggled(toggled_on: bool) -> void:
	audio_player.play()
	pass # Replace with function body.
