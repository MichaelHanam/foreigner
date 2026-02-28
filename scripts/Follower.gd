extends Node2D

@export var lead: CharacterBody2D;
@export var max_distance := 100.0
@export var speed := 10.0
@export var offset := Vector2(0, 0)

func _process(delta: float) -> void:
	var lead_velocity = lead.velocity * 0.3
	
	var target_x = lead.position.x + min(max_distance, abs(lead_velocity.x)) * sign(lead_velocity.x)
	var target_y = lead.position.y + min(max_distance, abs(lead_velocity.y)) * sign(lead_velocity.y)
	position.x = target_x + offset.x
	position.y = target_y + offset.y
	#position.x = move_toward(position.x, min(position.x + max_distance, max(position.x - max_distance, lead.position.x)), delta * speed)
	#position.y = move_toward(position.y, min(position.y + max_distance, max(position.y - max_distance, lead.position.y)), delta * speed)
