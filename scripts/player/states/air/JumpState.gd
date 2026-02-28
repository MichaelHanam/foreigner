extends AirState
class_name JumpState

const GRAVITY := 500.0

func enter(player):
	player.animator.play(PlayerAnimator.Animations.JUMP)
	player.movement.jump(player)
	player.audio.play_jumping()
	
func _air_update(player, state_machine, delta):
	player.gravity.apply(player, GRAVITY, delta)
	
	var direction = player.input.get_direction()
	
	if direction:
		player.movement.move_horizontally(player, direction)
	else:
		player.movement.stop_moving(player)
		
	if (player.input.jump_held() && player.velocity.y > 0):
		state_machine.change_state(PlayerStateMachine.StateID.GLIDE)
		
	elif (not player.input.jump_held() || player.velocity.y > 0):
		state_machine.change_state(PlayerStateMachine.StateID.FALL)
