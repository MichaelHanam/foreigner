extends PlayerState
class_name LockedState

func enter(player):
	player.velocity = Vector2(0, 0)
	player.animator.play(PlayerAnimator.Animations.FALL)
