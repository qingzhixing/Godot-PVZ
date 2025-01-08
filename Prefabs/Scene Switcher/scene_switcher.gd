extends Control
@onready var switch_timer: Timer = $SwitchTimer
var last_callback: Callable = func():;

func _ready() -> void:
	switch_timer.one_shot = true;
	switch_timer.timeout.connect(last_callback);

func _jump(path: String):
	get_tree().change_scene_to_file(path);
	pass
	
func timer_reconnect(callback: Callable):
	switch_timer.timeout.disconnect(last_callback);
	last_callback = callback;
	switch_timer.timeout.connect(callback);

func jump_to_scene(path: String):
	print("jumping to scene: " + path);
	delay_call(func(): _jump(path));
	pass

func delay_call(callback: Callable):
	timer_reconnect(callback);
	switch_timer.start();
	pass
