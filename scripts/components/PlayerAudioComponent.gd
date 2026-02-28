extends Node
class_name PlayerAudioComponent

@onready var sfx_player: AudioStreamPlayer2D = $SFXPlayer

@export var walking_sound: Array[AudioStream]
@export var gliding_sound: AudioStream
@export var landing_sound: Array[AudioStream]
@export var jumping_sound: Array[AudioStream]

func play_walking():
	play_random(walking_sound)
	
func play_gliding():
	_play(gliding_sound)
	
func play_landing():
	play_random(landing_sound)
	
func play_jumping():
	play_random(jumping_sound)

func play_random(sound: Array[AudioStream]):
	_play(sound.pick_random())

func stop():
	sfx_player.stop()

func _play(audio_stream: AudioStream):
	sfx_player.stream = audio_stream
	sfx_player.play()
