extends EntityState
class_name ActionState

const READY: StringName = &"Ready"
const WINDUP: StringName = &"Windup"
const DISABLED: StringName = &"Disabled"


func trigger_event(title: StringName, _external_entries: Dictionary) -> void:
	match title:
		EntityState.HP_ZERO:
			transition.emit(DISABLED)
