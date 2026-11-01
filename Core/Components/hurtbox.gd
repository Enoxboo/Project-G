extends Area2D
class_name Hurtbox

signal was_hit(attack: AttackDetails)

@onready var deactivate_time: Timer = $DeactivateTime


func on_hit(attack: AttackDetails) -> void:
	was_hit.emit(attack)


func deactivate_hurtbox_for(time: float) -> void:
	deactivate_time.start(time)
	set_deferred(&"monitorable", false)


func _on_deactivate_time_timeout() -> void:
	set_deferred(&"monitorable", true)
