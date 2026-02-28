extends Node

@export var max_move_speed := 300.0
@export var jump_velocity := -150.0
@export var acceleration := 40.0

var move_speed := max_move_speed
var has_jumped := false


func move(entity: CharacterBody2D, direction: float):
	entity.velocity.x = direction * max_move_speed
	
func jump(entity: CharacterBody2D):
	entity.velocity.y = jump_velocity

func apply(entity: CharacterBody2D):
	entity.move_and_slide()
