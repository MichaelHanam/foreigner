extends RigidBody2D

@onready var state_machine = $StateMachine
@onready var movement = $MovementComponent
@onready var gravity = $GravityComponent
@onready var input = $InputComponent
@onready var collider = $Collider
@onready var sprite = $Sprite
@onready var animator = $Animator
