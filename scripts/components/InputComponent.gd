extends Node
class_name InputComponent

var last_direction := 1

func get_direction() -> float:
	var direction = Input.get_axis('move_left', 'move_right')
	
	if direction != 0:
		last_direction = sign(direction)
		
	return direction

func get_last_direction() -> float:
	return last_direction

func jump_pressed() -> bool:
	return Input.is_action_pressed('jump')
