extends Node
class_name GravityComponent

@export var gravity := 300.0
@export var max_fall_speed := 1000.0

func apply(player: CharacterBody2D, delta: float):
	if (not player.is_on_floor()):
		player.velocity.y += gravity * delta
		player.velocity.y = min(player.velocity.y, max_fall_speed)
