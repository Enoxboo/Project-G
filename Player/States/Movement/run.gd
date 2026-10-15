extends PlayerMovementState


func update() -> void:
	player.velocity = player.data.speed * player.speed_multiplier * player.intent.movement_direction
	if player.intent.movement_direction.is_zero_approx():
		transition.emit(IDLE)
		return
	elif player.intent.dash:
		transition.emit(DASH)
		return
	else:
		player.last_direction = player.intent.movement_direction
