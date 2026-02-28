extends GroundedState
class_name IdleState

func enter(player):
	player.animator.play(PlayerAnimator.Animations.IDLE)

func _grounded_update(player, state_machine, delta):
	if (player.input.get_direction()):
		state_machine.change_state(PlayerStateMachine.StateID.MOVE)
		return
		
	player.movement.stop_moving(player)
