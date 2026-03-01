extends CharacterBody2D
class_name NPC

@onready var trigger: TriggerArea = $Trigger
@onready var gravity: GravityComponent = $GravityComponent
@onready var bounce: BounceComponent = $BounceComponent
@onready var carriable: CarriableComponent = $CarriableComponent
@onready var state_machine: NPCStateMachine = $StateMachine
@onready var collider: CollisionPolygon2D = $Collider
@onready var animator: NPCAnimationComponent = $AnimationComponent
@onready var audio: NPCAudioComponent = $AudioComponent
@onready var interact_display: InteractDisplayComponent = $InteractDisplayComponent

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.physics_process(delta)
	move_and_slide()

func _draw() -> void:
	state_machine.draw()
	carriable.draw(self)
