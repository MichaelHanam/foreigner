extends AirState
class_name GlideState

const GRAVITY := 50.0
const ACCELERATION := 15.0
const DECELERATION := 10.0

func enter(player):
	player.animator.play(PlayerAnimator.Animations.GLIDE)
	player.audio.stop()
	player.audio.play_gliding()
	
	if (player.movement.can_boost()):
		player.movement.boost(player)
	
func _air_update(player, state_machine, delta):
	player.gravity.apply(player, delta, GRAVITY)
	
	var direction = player.input.get_direction()
	
	if direction:
		player.movement.move_horizontally(player, direction, ACCELERATION)
	else:
		player.movement.stop_moving(player, DECELERATION)
		
	if (not player.input.jump_held()):
		state_machine.change_state(PlayerStateMachine.StateID.FALL)
	
func exit(player):
	player.audio.stop()
