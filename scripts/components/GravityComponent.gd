extends Node
class_name GravityComponent

@export var gravity_jump := 600.0
@export var gravity_fall := 600.0
@export var max_fall_speed := 1000.0

func apply(player: CharacterBody2D, gravity: float, delta: float):
	if (not player.is_on_floor()):
		player.velocity.y += gravity * delta
		player.velocity.y = min(player.velocity.y, max_fall_speed)
