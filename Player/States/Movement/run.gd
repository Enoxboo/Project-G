extends PlayerMovementState


func update() -> void:
	player.velocity = player.data.speed * player.speed_multiplier * player.input_direction
	if player.input_direction.is_zero_approx():
		transition.emit(IDLE)
		return
	elif Input.is_action_just_pressed("dash"):
		transition.emit(DASH)
		return
	else:
		player.last_direction = player.input_direction
