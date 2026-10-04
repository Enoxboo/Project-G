extends CharacterBody2D
class_name Player

@export var data: PlayerData
@export var spell_1: SpellData
@export var spell_2: SpellData

var input_direction: Vector2 = Vector2.ZERO
var last_direction: Vector2 = Vector2.RIGHT
var speed_multiplier: float = 1.0

@onready var movement_state_machine: StateMachine = $MovementStateMachine
@onready var action_state_machine: StateMachine = $ActionStateMachine


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug_self_hurt"):
		movement_state_machine.change_state(PlayerMovementState.KNOCKBACK, {"kb_direction": Vector2.RIGHT})
	elif Input.is_action_just_pressed("debug_death"):
		movement_state_machine.change_state(PlayerMovementState.DEATH)
		action_state_machine.change_state(PlayerActionState.DISABLED)

	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	movement_state_machine.physics_update()
	action_state_machine.physics_update()
	move_and_slide()
