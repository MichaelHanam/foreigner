extends Node
class_name GravityComponent

@export var gravity := 300.0

func apply(player: CharacterBody2D, delta: float):
	if (not player.is_on_floor()):
		player.velocity.y += gravity * delta
