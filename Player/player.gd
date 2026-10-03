extends CharacterBody2D
class_name Player

@export var data: PlayerData

var input_direction: Vector2 = Vector2.ZERO
var last_direction: Vector2 = Vector2.RIGHT

@onready var state_machine: StateMachine = $StateMachine


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug_self_hurt"):
		state_machine.change_state(PlayerState.KNOCKBACK, {"kb_direction": Vector2.RIGHT})

	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	state_machine.physics_update()
	move_and_slide()
