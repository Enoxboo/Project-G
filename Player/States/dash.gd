extends PlayerState

@onready var dash_timer: Timer = $DashTimer


func enter(_external_entries: Dictionary = {}) -> void:
	#enlève la hurtbox
	player.velocity = player.last_direction * player.data.dash_strength
	dash_timer.start(player.data.dash_time)


func update() -> void:
	if not dash_timer.is_stopped():
		return

	if player.input_direction.is_zero_approx():
		transition.emit(IDLE)
		return
	else:
		transition.emit(RUN)
		return
