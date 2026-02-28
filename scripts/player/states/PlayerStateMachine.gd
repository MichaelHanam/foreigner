extends Node

@export var states : Dictionary[String, Resource]
@export var initial_state : String

var current_state : PlayerState
var player

func init(player):
	player = player
	change_state(initial_state)
	
func change_state(state_name: String):
	if (current_state):
		current_state.exit(player)
	
	current_state = states[state_name]
	current_state.enter(player)

func physics_process(delta: float):
	if (current_state):
		current_state.physics_update(player, self, delta)
