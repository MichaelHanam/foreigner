extends Node
class_name PlayerStateMachine

enum StateID {
	IDLE,
	MOVE,
	JUMP,
	FALL
}

@export var states : Dictionary[StateID, Resource]
@export var initial_state : StateID

var current_state : PlayerState
var player

func init(player):
	player = player
	change_state(initial_state)
	
func change_state(state_id: StateID):
	if (current_state):
		current_state.exit(player)
	
	if (not states[state_id]):
		print('there is no state: ', state_id)
		pass
	
	print('changed state to: ', state_id)
	
	current_state = states[state_id]
	current_state.enter(player)

func physics_process(delta: float):
	if (current_state):
		current_state.physics_update(player, self, delta)

func draw():
	if (current_state):
		current_state.draw(player)
