extends Area2D
class_name TriggerArea

var player: Player

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		player = body

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('player'):
		player = null

func get_player() -> Player:
	return player
