extends Node
class_name NPCStateMachine

enum StateID {
	LOCKED,
	IDLE,
	CARRIED
}

@export var states: Dictionary[StateID, Resource]
@export var initial_state: StateID

var current_state : Resource
var npc : CharacterBody2D

func init(n: CharacterBody2D):
	npc = n
	change_state(initial_state)
	
func change_state(state_id: StateID):
	if (current_state):
		current_state.exit(npc)
	
	if (not states[state_id]):
		print('there is no state: ', StateID.keys()[state_id])
		pass
	
	print('changed state to: ', StateID.keys()[state_id])
	
	current_state = states[state_id]
	current_state.enter(npc)

func physics_process(delta: float):
	if (current_state):
		current_state.physics_update(npc, self, delta)

func draw():
	if (current_state):
		current_state.draw(npc)
