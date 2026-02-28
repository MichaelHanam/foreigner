extends Node2D
class_name InteractDisplayComponent

@onready var area: Area2D = $Area
@export var display_element: Node

var player: Player

func display():
	print('disgas')
	display_element.visible = true
	
func stop_display():
	display_element.visible = false

func _on_area_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group('player'):
		player = body

func _on_area_body_exited(body: Node2D) -> void:
	if body.is_in_group('player'):
		player = null
