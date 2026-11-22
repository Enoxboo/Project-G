extends MovementState


func enter(_external_entries: Dictionary = {}) -> void:
	entity.velocity = Vector2.ZERO
	entity.hurtbox.disable()
	print("You died")


func trigger_event(title: StringName, _external_entries: Dictionary) -> void:
	match title:
		EntityState.HP_ZERO:
			pass
