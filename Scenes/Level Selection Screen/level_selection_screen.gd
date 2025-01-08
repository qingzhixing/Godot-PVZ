extends Node2D

func _ready() -> void:
	MusicController.play_stream(MusicController.music_ChooseYourSeeds);
