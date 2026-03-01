extends Node2D
class_name CarriableComponent

@export var size := Vector2(10, 10)
@export var distance := 20

const ALPHA := 1
const PLACABLE_COLOR := Color(0, 1, 0, ALPHA)
const UNPLACABLE_COLOR := Color(1, 0, 0, ALPHA)

var should_draw := false
var is_placable := false
var preview_rect: Rect2

func set_placable(placable : bool):
	is_placable = placable

func set_rect(carrying: Player):
	var location = Vector2(carrying.position.x + (distance * carrying.input.get_last_direction()),
		carrying.position.y)
	preview_rect = Rect2(location, size)

func on_picked_up(carrying: Player):
	print('im getting picked up')
	pass

func on_placed(carrying: Player):
	pass

func draw(entity: NPC):
	entity.draw_rect(Rect2(preview_rect.position - entity.position, preview_rect.size), PLACABLE_COLOR if is_placable else UNPLACABLE_COLOR, true)
