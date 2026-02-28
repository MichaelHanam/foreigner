extends RigidBody2D
class_name Player

@onready var state_machine: PlayerStateMachine = $StateMachine
@onready var movement: MovementComponent = $MovementComponent
@onready var gravity: GravityComponent = $GravityComponent
@onready var input: InputComponent = $InputComponent
@onready var collider: CollisionShape2D = $Collider
@onready var sprite: Sprite2D = $Sprite
@onready var animator: AnimationPlayer = $Animator

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.physics_process(delta)

func _draw() -> void:
	state_machine.draw()
