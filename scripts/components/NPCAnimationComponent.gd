extends Node
class_name NPCAnimationComponent

@export var animation_player: NPCAnimator

func play(animation_id: NPCAnimator.Animations) -> void:
	var animation_name = NPCAnimator.Animations.keys()[animation_id]

	if (animation_player.current_animation != animation_name):
		animation_player.play(animation_name)

func is_animation_over() -> bool:
	return not animation_player.is_playing()
