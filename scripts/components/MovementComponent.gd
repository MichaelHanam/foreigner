extends Node
class_name MovementComponent

@export var max_move_speed := 300.0
@export var jump_velocity := -150.0
@export var acceleration := 40.0
@export var deceleration := 40.0
@export var jump_buffer_time := 0.15
@export var coyote_time := 0.15

var jump_buffer_timer := 0.0
var coyote_timer := 0.0

var move_speed := max_move_speed
var has_jumped := false

func move_horizontally(entity: CharacterBody2D, direction: float, 
	move_speed: float = move_speed,
	acceleration: float = acceleration):
	
	entity.velocity.x = move_toward(entity.velocity.x, 
		move_speed * direction, acceleration)

func stop_moving(entity: CharacterBody2D, deceleration: 
	float = deceleration):
		
	entity.velocity.x = move_toward(entity.velocity.x, 0, 
		deceleration)

func jump(entity: CharacterBody2D):
	entity.velocity.y = jump_velocity
	has_jumped = true

func start_buffer_timer():
	jump_buffer_timer = jump_buffer_time
	
func start_coyote_timer():
	coyote_timer = coyote_time

func reset_jumps():
	has_jumped = false
	
func can_jump() -> bool: 
	return not has_jumped && (jump_buffer_timer || coyote_timer)

func apply(entity: CharacterBody2D):
	entity.move_and_slide()
	
func _physics_process(delta: float) -> void:
	jump_buffer_timer = max(0, jump_buffer_timer - delta)
	coyote_timer = max(0, coyote_timer - delta)
	
