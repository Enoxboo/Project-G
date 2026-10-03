extends PlayerState


func enter(_external_entries: Dictionary = {}) -> void:
	player.velocity = Vector2.ZERO


func update() -> void:
	if not player.input_direction.is_zero_approx():
		transition.emit(RUN)
		return
	elif Input.is_action_just_pressed("dash"):
		transition.emit(DASH)
		return
