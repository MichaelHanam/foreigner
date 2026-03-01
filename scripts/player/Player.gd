extends CharacterBody2D
class_name Player

@onready var state_machine: PlayerStateMachine = $StateMachine
@onready var movement: MovementComponent = $MovementComponent
@onready var gravity: GravityComponent = $GravityComponent
@onready var input: InputComponent = $InputComponent
@onready var audio: PlayerAudioComponent = $AudioComponent
@onready var carrying: CarryingComponent = $CarryingComponent
@onready var collider: CollisionShape2D = $Collider
@onready var sprite: PlayerSprite = $Sprite
@onready var animator: AnimationComponent = $AnimationComponent

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.physics_process(delta)
	carrying.physics_update(self)
	flip_sprite()

func flip_sprite():
	sprite.is_sprite_flipped(input.get_last_direction() == -1)

func _draw() -> void:
	state_machine.draw()
