extends PlayerState
class_name GroundedState

func physics_update(player, state_machine, delta):
	if (not player.is_on_floor()):
		state_machine.change_state(PlayerStateMachine.StateID.FALL)
		return
		
	if (player.movement.can_jump()):
		state_machine.change_state(PlayerStateMachine.StateID.JUMP)
		return
		
	if (not player.input.jump_pressed()):
		player.movement.reset_jumps()
	else:
		player.movement.start_buffer_time()
	
	_grounded_update(player, state_machine, delta)
	player.movement.apply(player)

func _grounded_update(player: Player, 
	state_machine: PlayerStateMachine, delta: float):
		
	pass
