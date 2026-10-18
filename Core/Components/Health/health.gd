extends Node
class_name Health

signal health_changed(old_value: int, new_value: int)
signal hp_zero()

@export var max_health: int = 10

var current_health: int


func _ready() -> void:
	current_health = max_health


func take_damage(damage: int) -> void:
	if current_health <= 0:
		return

	var previous_health: int = current_health
	current_health = clampi(current_health - damage, 0, max_health)
	health_changed.emit(previous_health, current_health)
	print("New health: " + str(current_health))
	if current_health == 0:
		hp_zero.emit()
