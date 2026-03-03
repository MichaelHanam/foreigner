extends Node2D
class_name DebugDrawComponent

@export var color : Color

var debug_shape: Shape2D
var debug_transform: Transform2D
var collision_result := false
var show_debug := false

func set_debug(shape: Shape2D, transform: Transform2D, is_colliding: bool):
	debug_shape = shape
	debug_transform = transform
	collision_result = is_colliding
	show_debug = true
	queue_redraw()
	
func _draw() -> void:
	if not show_debug or not debug_shape:
		return
	
	draw_set_transform(
		to_local(debug_transform.get_origin()),
		debug_transform.get_rotation(), 
		debug_transform.get_scale()
	)
	
	var extents = debug_shape.extents
	draw_rect(Rect2(-extents, extents * 2), color, false, 2)
	
	draw_set_transform(Vector2.ZERO, 0, Vector2.ONE)
