extends PlayerMovementState


func enter(_external_entries: Dictionary = {}) -> void:
	player.velocity = Vector2.ZERO


func update() -> void:
	if not player.intent.movement_direction.is_zero_approx():
		transition.emit(RUN)
		return
	elif player.intent.dash:
		transition.emit(DASH)
		return
