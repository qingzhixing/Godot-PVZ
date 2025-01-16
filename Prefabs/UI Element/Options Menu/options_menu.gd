extends Node2D

@export var sound_sfx_slide_end_audio: AudioStream;

@onready var sfx: AudioStreamPlayer2D = $SFX

var offset: Vector2 = Vector2(0, 0)
var is_dragging: bool = false

func bg_drag_start() -> void:
	is_dragging = true
	offset = position - get_global_mouse_position()

func bg_drag_stop() -> void:
	is_dragging = false

@warning_ignore("unused_parameter")
func _process(delta):
	if is_dragging:
		position = get_global_mouse_position() + offset

func full_screen_toggled(toggled_on: bool) -> void:
	GlobalSettings.full_screen = toggled_on


func acceleration_3D(toggled_on: bool) -> void:
	GlobalSettings.acceleration_3D = toggled_on


func music_volume_changed(value: float) -> void:
	GlobalSettings.set_music_volume(value)


func SFX_volume_changed(value: float) -> void:
	GlobalSettings.set_sfx_volume(value)


func sfx_drag_stop() -> void:
	if sound_sfx_slide_end_audio:
		sfx.stream = sound_sfx_slide_end_audio
		sfx.play()
