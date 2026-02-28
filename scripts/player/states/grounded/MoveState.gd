extends GroundedState
class_name MoveState

func enter(player):
	player.animator.play(PlayerAnimator.Animations.WALK)

func _grounded_update(player, state_machine, delta):
	if (not player.input.get_direction()):
		state_machine.change_state(PlayerStateMachine.StateID.IDLE)
		
	player.movement.move_horizontally(player, player.input.get_direction())
	player.audio.play_walking()
	
func exit(player):
	player.audio.stop()
