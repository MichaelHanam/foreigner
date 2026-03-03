extends NPCState
class_name NPCIdleState

func physics_update(npc, state_machine, delta):
	npc.gravity.apply(npc, delta)
	
	if (npc.interact_display.get_player()):
		var player = npc.interact_display.get_player()
		npc.interact_display.display()
		
		if (player.input.action_pressed()):
			player.carrying.pick_up(player, npc)
	else:
		npc.interact_display.stop_display()
	
	if npc.trigger.get_player():
		npc.trigger.get_player().state_machine.change_state(PlayerStateMachine.StateID.LOCKED)
		state_machine.change_state(NPCStateMachine.StateID.LOADING)

func exit(npc):
	npc.interact_display.stop_display()
