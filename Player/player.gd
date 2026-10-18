extends Entity
class_name Player

@onready var movement_state_machine: StateMachine = $MovementStateMachine
@onready var action_state_machine: StateMachine = $ActionStateMachine
@onready var health: Health = $Health


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_self_hurt"):
		health.take_damage(1)
	super._physics_process(delta)
