extends Node
class_name CarryingComponent

@export var offset := Vector2(0, 0)
@export var collider : CollisionShape2D

var carried_object: NPC

func pick_up(player: Player, object: NPC):
	if carried_object:
		return
	
	carried_object = object
	carried_object.state_machine.change_state(NPCStateMachine.StateID.LOCKED)
	carried_object.carriable.on_picked_up(player)

func place(player: Player):
	carried_object.carriable.on_placed(player)
	carried_object = null

func can_place(player: Player):
	if not carried_object: return false
	
	var carried_object_rect = carried_object.carriable.preview_rect
	var space_state = player.get_world_2d().direct_space_state
	var query_rect = RectangleShape2D.new()
	query_rect.size = carried_object_rect.size
	
	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = query_rect
	query.transform = Transform2D(0, carried_object_rect.position)
	query.collision_mask = player.collision_mask
	
	var results = space_state.intersect_shape(query)
	
	return results.is_empty()
	
func physics_update(player: Player):
	if carried_object:
		carried_object.position = player.position + offset
		carried_object.carriable.set_placable(can_place(player))
		carried_object.carriable.set_rect(player)
		carried_object.queue_redraw()
