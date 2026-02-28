extends Node
class_name AnimationComponent

@export var animation_player: PlayerAnimator

func play(animation_id: PlayerAnimator.Animations) -> void:
	var animation_name = PlayerAnimator.Animations.keys()[animation_id]

	if (animation_player.current_animation != animation_name):
		animation_player.play(animation_name)
