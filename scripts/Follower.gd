extends Node2D

@export var lead: CharacterBody2D;
@export var max_distance := 100.0
@export var offset := Vector2(0, 0)

func _process(delta: float) -> void:
	var lead_velocity = lead.velocity * 0.4
	
	var target_x = lead.position.x + min(max_distance, abs(lead_velocity.x)) * sign(lead_velocity.x)
	var target_y = lead.position.y + min(max_distance, abs(lead_velocity.y)) * sign(lead_velocity.y)
	position.x = target_x + offset.x
	position.y = target_y + offset.y
