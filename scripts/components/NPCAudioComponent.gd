extends Node
class_name NPCAudioComponent

@onready var sfx_player: AudioStreamPlayer2D = $SFXPlayer

@export var loading_sound: AudioStream
@export var trigger_sound: AudioStream
@export var carry_sound: AudioStream
@export var pitch_variation := 0.1

func play_loading():
	stop()
	_play(loading_sound)
	
func play_trigger():
	stop()
	_play(trigger_sound)
	
func play_carry():
	stop()
	_play(carry_sound)

func stop():
	sfx_player.stop()

func _play(audio_stream: AudioStream):
	if (not sfx_player.playing):
		sfx_player.pitch_scale = randf_range(1 - pitch_variation, 1 + pitch_variation)
		sfx_player.stream = audio_stream
		sfx_player.play()
