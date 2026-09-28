extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity = Vector2.ZERO

func physics_update(_delta: float) -> void:
	if not get_input_direction().is_zero_approx():
		finished.emit(RUN)
