extends MovementState


func update() -> void:
	entity.velocity = entity.data.speed * entity.speed_multiplier * entity.intent.movement_direction
	if entity.intent.movement_direction.is_zero_approx():
		transition.emit(IDLE)
		return
	elif entity.intent.dash:
		transition.emit(DASH)
		return
	else:
		entity.last_direction = entity.intent.movement_direction
