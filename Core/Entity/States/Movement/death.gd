extends MovementState


func enter(_external_entries: Dictionary = {}) -> void:
	entity.velocity = Vector2.ZERO
	print("You died")
