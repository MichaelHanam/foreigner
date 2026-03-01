extends Node
class_name GravityComponent

@export var gravity := 600.0
@export var max_fall_speed := 1000.0

func apply(entity: CharacterBody2D, delta: float, gravity: float = gravity, max_rise_velocity: float = -INF):
	entity.velocity.y = max(max_rise_velocity, entity.velocity.y)
	
	if (not entity.is_on_floor()):
		entity.velocity.y += gravity * delta
		entity.velocity.y = min(entity.velocity.y, max_fall_speed)
