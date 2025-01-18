extends Node2D

@export var sound_sfx_slide_end_audio: AudioStream;

@onready var sfx: AudioStreamPlayer2D = $SFX
@onready var music_slider: CustomSlider = $"Music Setting/Slider"
@onready var sfx_slider: CustomSlider = $"Sound FX/Slider"
@onready var full_screen_check_box: CheckBox = $"Full Screen/CheckBox"

var offset: Vector2 = Vector2(0, 0)
var is_dragging: bool = false

signal view_almanac_clicked;
signal restart_level_clicked;
signal main_menu_buttun_clicked;
signal back_to_game_clicked;

func bg_drag_start() -> void:
	is_dragging = true
	offset = position - get_global_mouse_position()

func bg_drag_stop() -> void:
	is_dragging = false

@warning_ignore("unused_parameter")
func _process(delta):
	if is_dragging:
		position = get_global_mouse_position() + offset

func _ready():
	music_slider.knob_restore(GlobalSettings.music_volume)
	sfx_slider.knob_restore(GlobalSettings.sfx_volume)
	full_screen_check_box.button_pressed = GlobalSettings.get_fullscreen()
	pass

func full_screen_toggled(toggled_on: bool) -> void:
	GlobalSettings.set_fullscreen(toggled_on)


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


func _on_view_almanac_button_clicked() -> void:
	view_almanac_clicked.emit()
	pass # Replace with function body.


func _on_restart_level_button_clicked() -> void:
	restart_level_clicked.emit()
	pass # Replace with function body.


func _on_main_menu_button_clicked() -> void:
	main_menu_buttun_clicked.emit()
	pass # Replace with function body.


func _on_back_to_game_2_pressed() -> void:
	back_to_game_clicked.emit()
	pass # Replace with function body.
