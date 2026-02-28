extends AirState
class_name FallState

func _air_update(player, state_machine, delta):
	var direction = player.input.get_direction()
	
	if direction:
		player.movement.move_horizontally(player, direction)
	else:
		player.movement.stop_moving(player)
		
	if (player.velocity.y > 0):
		state_machine.change_state(PlayerStateMachine.StateID.FALL)

func print_name():
	print('fall')
