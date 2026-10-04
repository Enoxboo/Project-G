extends PlayerMovementState


func enter(_external_entries: Dictionary = {}) -> void:
	player.velocity = Vector2.ZERO
	print("You died")
