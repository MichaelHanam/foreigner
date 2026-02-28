extends GroundedState

func enter(player):
	player.movement.reset_jumps()

func _grounded_update(player, state_machine, delta):
	player.movement.stop_moving(player)
	
	if (player.input.get_direction()):
		state_machine.change_state(PlayerStateMachine.StateID.MOVE)
		return
	
	if (player.input.jump_pressed()):
		state_machine.change_state(PlayerStateMachine.StateID.JUMP)
