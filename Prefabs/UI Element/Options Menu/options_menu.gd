extends Node2D

@export var sound_sfx_slide_end_audio: AudioStream;
@export var in_game_mode = true;

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

@onready var _3d_acceleration_container: Node2D = $"3D ACCELERATION"
@onready var full_screen_container: Node2D = $"Full Screen"
@onready var view_almanac_container: Control = $"View Almanac"
@onready var restart_level_container: Control = $"Restart Level"
@onready var main_menu_container: Control = $"Main Menu"
@onready var back_to_game_2_container: CustomTextureButton = $"Back To Game2"
@onready var ok_container: CustomTextureButton = $OK

func visibility_handler():
	_3d_acceleration_container.visible = !in_game_mode;
	full_screen_container.visible = !in_game_mode;
	view_almanac_container.visible = in_game_mode;
	restart_level_container.visible = in_game_mode;
	main_menu_container.visible = in_game_mode
	back_to_game_2_container.visible = in_game_mode;
	ok_container.visible = !in_game_mode

func _ready():
	music_slider.knob_restore(GlobalSettings.music_volume)
	sfx_slider.knob_restore(GlobalSettings.sfx_volume)
	full_screen_check_box.button_pressed = GlobalSettings.get_fullscreen()

	visibility_handler();
	

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
