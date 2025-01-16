extends Node

var game_speed: float = 1.0
var game_difficulty: float = 1.0
var music_volume: float = 1.0
var sfx_volume: float = 1.0

var player_name: String = "qingzhixing"

var full_screen: bool = false
var show_fps: bool = false
var acceleration_3D = false

func set_fullscreen(value: bool):
	full_screen = value;
	if full_screen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func set_music_volume(value: float):
	music_volume = max(0.0, min(1.0, value))
	
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), music_volume <= 0.01)
	
	var volume_value = (1 - music_volume) * (-15.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), volume_value);
	
func set_sfx_volume(value: float):
	sfx_volume = max(0.0, min(1.0, value))
	
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), sfx_volume <= 0.01)
	
	var volume_value = (1 - sfx_volume) * (-15.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), volume_value);
