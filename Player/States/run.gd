extends PlayerState

func physics_update(_delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.velocity = player.data.speed * input_direction
	
	if input_direction.is_equal_approx(Vector2.ZERO):
		finished.emit(IDLE)
