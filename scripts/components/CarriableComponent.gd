extends Node2D
class_name CarriableComponent

@export var size := Vector2(10, 10)
@export var distance := 20

const ALPHA := 0.6
const PLACABLE_COLOR := Color(0.4, 0.4, 0.4, ALPHA)
const UNPLACABLE_COLOR := Color(1, 0, 0, ALPHA)
const SNAPPING := 16

var should_draw := false
var is_placable := false
var preview_rect: Rect2

func set_is_placable(placable : bool):
	is_placable = placable

func set_rect(carrying: Player):
	var location = Vector2(carrying.position.x + ((size.x + distance) * carrying.input.get_last_direction()),
		carrying.position.y - size.y / 2)
	#location.x = location.x - (int(location.x) % SNAPPING) + (SNAPPING if carrying.input.get_last_direction() == 1 else 0)
	preview_rect = Rect2(location, size)

func on_picked_up(carrying: Player, entity: NPC):
	entity.state_machine.change_state(NPCStateMachine.StateID.LOCKED)
	should_draw = true

func on_placed(carrying: Player, entity: NPC):
	entity.position = Vector2(carrying.position.x + ((size.x + distance) * carrying.input.get_last_direction()), carrying.position.y)
	entity.state_machine.change_state(NPCStateMachine.StateID.IDLE)
	should_draw = false

func draw_preview_rect(entity: NPC):
	if should_draw:
		entity.draw_rect(Rect2(preview_rect.position - entity.position - Vector2(size.x / 2, size.y / 2), preview_rect.size), PLACABLE_COLOR if is_placable else UNPLACABLE_COLOR, true)
