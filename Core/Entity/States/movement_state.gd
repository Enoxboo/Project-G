extends EntityState
class_name MovementState

const IDLE: StringName = &"Idle"
const RUN: StringName = &"Run"
const DASH: StringName = &"Dash"
const KNOCKBACK: StringName = &"Knockback"
const DEATH: StringName = &"Death"


func trigger_event(title: StringName, _external_entries: Dictionary) -> void:
	match title:
		EntityState.HP_ZERO:
			transition.emit(DEATH)
