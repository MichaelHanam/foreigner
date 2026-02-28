extends AirState
class_name FallState

func enter(player):
	player.animator.play(PlayerAnimator.Animations.FALL)

func _air_update(player, state_machine, delta):
	var direction = player.input.get_direction()
	
	if direction:
		player.movement.move_horizontally(player, direction)
	else:
		player.movement.stop_moving(player)
		
	if (player.is_on_floor()):
		state_machine.change_state(PlayerStateMachine.StateID.IDLE)
