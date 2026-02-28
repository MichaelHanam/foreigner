extends AirState
class_name FallState

const GRAVITY := 800.0
const ACCELERATION_MULTIPLIER := 0.75

func enter(player):
	player.velocity.y *= ACCELERATION_MULTIPLIER
	player.animator.play(PlayerAnimator.Animations.FALL)

func _air_update(player, state_machine, delta):
	player.gravity.apply(player, GRAVITY , delta)
	
	var direction = player.input.get_direction()
	
	if direction:
		player.movement.move_horizontally(player, direction)
	else:
		player.movement.stop_moving(player)
	
	if (player.input.jump_pressed()):
		player.movement.start_buffer_timer()
		
		if (player.movement.can_jump()):
			state_machine.change_state(PlayerStateMachine.StateID.JUMP)
		
	if (player.is_on_floor()):
		state_machine.change_state(PlayerStateMachine.StateID.IDLE)
