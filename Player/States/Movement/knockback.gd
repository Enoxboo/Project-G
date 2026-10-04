extends PlayerMovementState

@onready var kb_timer: Timer = $KBTimer
var debug_kb_strength: float = 100.0
var debug_kb_time: float = 0.2


func enter(external_entries: Dictionary = {}) -> void:
	player.velocity = debug_kb_strength * external_entries["kb_direction"]
	kb_timer.start(debug_kb_time)


func update() -> void:
	if not kb_timer.is_stopped():
		return

	if player.input_direction.is_zero_approx():
		transition.emit(IDLE)
		return
	else:
		transition.emit(RUN)
		return
