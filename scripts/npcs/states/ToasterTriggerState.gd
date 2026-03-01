extends NPCState
class_name ToasterTriggerState

func enter(npc):
	npc.audio.play_trigger()
	npc.animator.play(NPCAnimator.Animations.TRIGGER)
	
	var player = npc.trigger.get_player()
	npc.bounce.apply(player)
	player.state_machine.change_state(PlayerStateMachine.StateID.FALL)
	
func physics_update(npc, state_machine, delta):
	if npc.animator.is_animation_over():
		state_machine.change_state(NPCStateMachine.StateID.IDLE)
