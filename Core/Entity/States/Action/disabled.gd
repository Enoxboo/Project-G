extends ActionState


func trigger_event(title: StringName, external_entries: Dictionary) -> void:
	match title:
		EntityState.HP_ZERO:
			pass
		_:
			super.trigger_event(title, external_entries)
