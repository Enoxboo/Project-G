extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	print("Entrée dans Idle, venait de: ", previous_state_path)

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_right"):
		finished.emit(IDLE)
