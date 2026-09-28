extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity = Vector2.ZERO

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_any"):
		finished.emit(RUN)
