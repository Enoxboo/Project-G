extends PlayerState

func physics_update(_delta: float) -> void:
	var input_direction: Vector2 = get_input_direction()
	player.velocity = player.data.speed * input_direction
	
	if input_direction.is_zero_approx():
		finished.emit(IDLE)
