extends MovementState

@onready var dash_timer: Timer = $DashTimer


func enter(_external_entries: Dictionary = {}) -> void:
	var data: PlayerData = entity.data
	entity.hurtbox.deactivate_hurtbox_for(data.i_time)
	entity.velocity = entity.last_direction * data.dash_strength
	dash_timer.start(data.dash_time)


func update() -> void:
	if not dash_timer.is_stopped():
		return

	if entity.intent.movement_direction.is_zero_approx():
		transition.emit(IDLE)
		return
	else:
		transition.emit(RUN)
		return
