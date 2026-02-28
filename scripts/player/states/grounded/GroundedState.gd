extends PlayerState
class_name GroundedState

func physics_update(player, state_machine, delta):
	if (not player.is_on_floor()):
		player.movement.start_coyote_timer()
		state_machine.change_state(PlayerStateMachine.StateID.FALL)
		return
		
	if (player.movement.can_jump() && player.movement.is_in_buffer_time()):
		state_machine.change_state(PlayerStateMachine.StateID.JUMP)
		return

	player.movement.reset_jumps()
	
	if (player.input.jump_pressed()):
		player.movement.start_buffer_timer()
	
	_grounded_update(player, state_machine, delta)
	player.movement.apply(player)

func _grounded_update(player: Player, 
	state_machine: PlayerStateMachine, delta: float):
		
	pass
