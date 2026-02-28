extends PlayerState
class_name GroundedState

func physics_update(player, state_machine, delta):
	if (not player.is_on_floor()):
		state_machine.change_state(PlayerStateMachine.StateID.FALL)
		return
	
	player.gravity.apply(player, delta)
	_grounded_update(player, state_machine, delta)
	player.movement.apply(player)

func _grounded_update(player: Player, 
	state_machine: PlayerStateMachine, delta: float):
		
	pass
