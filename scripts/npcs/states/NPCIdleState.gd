extends NPCState
class_name NPCIdleState

func physics_update(npc, state_machine, delta):
	npc.gravity.apply(npc, delta)
	
	if npc.trigger.get_player():
		npc.trigger.get_player().state_machine.change_state(PlayerStateMachine.StateID.LOCKED)
		state_machine.change_state(NPCStateMachine.StateID.LOADING)
