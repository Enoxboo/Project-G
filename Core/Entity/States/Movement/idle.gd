extends MovementState


func enter(_external_entries: Dictionary = {}) -> void:
	entity.velocity = Vector2.ZERO


func update() -> void:
	if not entity.intent.movement_direction.is_zero_approx():
		transition.emit(RUN)
		return
	elif entity.intent.dash:
		transition.emit(DASH)
		return
