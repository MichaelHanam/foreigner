extends GroundedState
class_name MoveState

func _grounded_update(player, state_machine, delta):
	if (not player.input.get_direction()):
		state_machine.change_state(PlayerStateMachine.StateID.IDLE)
		
	player.movement.move_horizontally(player, player.input.get_direction())
	
	if (player.input.jump_pressed()):
		state_machine.change_state(PlayerStateMachine.StateID.JUMP)
