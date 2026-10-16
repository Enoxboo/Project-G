extends Entity
class_name Player

@onready var movement_state_machine: StateMachine = $MovementStateMachine
@onready var action_state_machine: StateMachine = $ActionStateMachine


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_self_hurt"):
		movement_state_machine.change_state(MovementState.KNOCKBACK, {"kb_direction": Vector2.RIGHT})
	elif Input.is_action_just_pressed("debug_death"):
		movement_state_machine.change_state(MovementState.DEATH)
		action_state_machine.change_state(ActionState.DISABLED)
	super._physics_process(delta)
