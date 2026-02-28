extends Node
class_name InputComponent

func get_direction() -> float:
	return Input.get_axis('move_left', 'move_right')
	
func jump_pressed() -> bool:
	return Input.is_action_pressed('jump')
