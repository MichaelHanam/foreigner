extends NPCState
class_name NPCLoadingState

func enter(npc):
	npc.animator.play(NPCAnimator.Animations.LOADING)
	
func physics_update(npc, state_machine, delta):
	if npc.animator.is_animation_over():
		state_machine.change_state(NPCStateMachine.StateID.TRIGGER)
