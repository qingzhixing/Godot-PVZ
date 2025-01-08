extends Control

@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var music_BrainiacManiac: AudioStream;
@export var music_Loonboon: AudioStream; # 保龄球
@export var music_UltimateBattle: AudioStream;
@export var music_ZombiesOnYourLawn: AudioStream;
@export var music_Grasswalk: AudioStream; # 白天
@export var music_RigorMormist: AudioStream; # 浓雾
@export var music_ZenGarden: AudioStream; # 结算 禅境花园
@export var music_GrazeTheRoof: AudioStream; # 屋顶
@export var music_ChooseYourSeeds: AudioStream; # 选卡
@export var music_Moongrains: AudioStream; # 夜晚
@export var music_Cerebrawl: AudioStream; # 夜晚小游戏
@export var music_WateryGraves: AudioStream; # 泳池
@export var music_Crazy_Dave: AudioStream; # 主菜单

var last_stream: AudioStream;

func _ready():
	audio_player.stream = music_Crazy_Dave;

func play_stream(stream: AudioStream):
	if last_stream == stream:
		return ;
	last_stream = stream;
	audio_player.stop();
	audio_player.stream = stream;
	audio_player.play();

func stop():
	audio_player.stop();

func set_volume(volume: float):
	audio_player.volume = volume;
