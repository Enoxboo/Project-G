extends Area2D
class_name Hurtbox

signal was_hit(attack: AttackDetails)

@onready var deactivate_time: Timer = $DeactivateTime


func on_hit(attack: AttackDetails) -> void:
	was_hit.emit(attack)


func disable() -> void:
	deactivate_time.stop()
	set_deferred(&"monitorable", false)


func enable() -> void:
	set_deferred(&"monitorable", true)


func disable_for(time: float) -> void:
	disable()
	deactivate_time.start(time)


func _on_deactivate_time_timeout() -> void:
	enable()
