extends Node
class_name BounceComponent

@export var bounce_strength := 200.0

func apply(entity: CharacterBody2D, force: float = bounce_strength):
	entity.velocity.y = -force
