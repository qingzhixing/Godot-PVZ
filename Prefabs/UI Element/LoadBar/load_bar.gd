extends Node2D

@onready var mask: Node2D = $CanvasGroup/Mask
@onready var sod_roll_cap: Sprite2D = $SodRollCap
@onready var roll_cap_animation: AnimationPlayer = $RollCapAnimation
@onready var themed_button: Button = $ThemedButton

@onready var sprout: Node2D = $Sprouts/Sprout
@onready var sprout_2: Node2D = $Sprouts/Sprout2
@onready var sprout_3: Node2D = $Sprouts/Sprout3

@export var loading_time_seconds: float = 10;
@export_range(0, 1) var sprout1_progress: float;
@export_range(0, 1) var sprout2_progress: float;
@export_range(0, 1) var sprout3_progress: float;

signal sprout1_sprout;
signal sprout2_sprout;
signal sprout3_sprout;
signal button_clicked;

var sprout1_sprouted: bool = false;
var sprout2_sprouted: bool = false;
var sprout3_sprouted: bool = false;

var loaded_time: float = 0;
var loading_process: float = 0;

const MIN_MASK_X: float = -157;
const MAX_MASK_X: float = 0
;
const MIN_SCALE_X: float = 0;
const MAX_SCALE_X: float = 314;

const MIN_CAP_ROLL_X: float = -152;
const MAX_CAP_ROLL_X: float = 136;

func on_button_click():
	emit_signal("button_clicked");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mask.scale.x = 0;
	mask.position.x = -mask.scale.x / 2;
	sod_roll_cap.position.x = MIN_CAP_ROLL_X;
	themed_button.disabled = true;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# update loading process
	loaded_time += delta;
	loading_process = min(1, loaded_time / loading_time_seconds);

	# update position & scale
	mask.scale.x = lerp(MIN_SCALE_X, MAX_SCALE_X, loading_process);
	mask.position.x = lerp(MIN_MASK_X, MAX_MASK_X, loading_process);
	sod_roll_cap.position.x = lerp(MIN_CAP_ROLL_X, MAX_CAP_ROLL_X, loading_process);

	# switch roll cap animation
	if loaded_time >= loading_time_seconds:
		roll_cap_animation.play("RESET");
		themed_button.disabled = false;
	
	# sprout animation
	if loading_process >= sprout1_progress && !sprout1_sprouted:
		sprout1_sprouted = true;
		emit_signal("sprout1_sprout");

	if loading_process >= sprout2_progress && !sprout2_sprouted:
		sprout2_sprouted = true;
		emit_signal("sprout2_sprout");
		
	if loading_process >= sprout3_progress && !sprout3_sprouted:
		sprout3_sprouted = true;
		emit_signal("sprout3_sprout");
	pass
