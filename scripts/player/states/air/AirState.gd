extends PlayerState
class_name AirState

func physics_update(player, state_machine, delta):
	_air_update(player, state_machine, delta)
	
	if (player.is_on_floor() && player.velocity.y >= 0):
		state_machine.change_state(PlayerStateMachine.StateID.IDLE)
		return
		
	player.movement.apply(player)

func _air_update(player: Player, 
	state_machine: PlayerStateMachine, delta: float):
		
	pass
