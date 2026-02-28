extends Node
class_name MovementComponent

@export var max_move_speed := 300.0
@export var jump_velocity := -150.0
@export var boost_velocity := -50
@export var acceleration := 40.0
@export var deceleration := 40.0
@export var jump_buffer_time := 0.15
@export var coyote_time := 0.15

var jump_buffer_timer := 0.0
var coyote_timer := 0.0

var move_speed := max_move_speed
var has_jumped := false
var has_boosted := false

func move_horizontally(entity: CharacterBody2D, direction: float, 
	acceleration: float = acceleration,
	move_speed: float = move_speed):
	
	entity.velocity.x = move_toward(entity.velocity.x, 
		move_speed * direction, acceleration)

func stop_moving(entity: CharacterBody2D, deceleration: 
	float = deceleration):
		
	entity.velocity.x = move_toward(entity.velocity.x, 0, 
		deceleration)

func jump(entity: CharacterBody2D, velocity: float = jump_velocity):
	entity.velocity.y = velocity
	has_jumped = true

func boost(entity: CharacterBody2D, velocity: float = boost_velocity):
	entity.velocity.y += velocity
	has_boosted = true

func start_buffer_timer():
	jump_buffer_timer = jump_buffer_time
	
func start_coyote_timer():
	coyote_timer = coyote_time

func reset_jumps():
	has_jumped = false
	has_boosted = false
	
func can_jump() -> bool: 
	return not has_jumped
	
func can_boost() -> bool:
	return not has_boosted
	
func is_in_buffer_time() -> bool:
	return jump_buffer_timer
	
func is_in_coyote_time() -> bool:
	return coyote_timer

func apply(entity: CharacterBody2D):
	entity.move_and_slide()
	
func _physics_process(delta: float) -> void:
	jump_buffer_timer = max(0, jump_buffer_timer - delta)
	coyote_timer = max(0, coyote_timer - delta)
	
