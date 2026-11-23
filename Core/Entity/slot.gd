extends RefCounted
class_name Slot

var action: ActionData
var time_left: float = 0.0
#var mutation


func fill_slot(p_action: ActionData) -> void:
	action = p_action


func start_cooldown() -> void:
	time_left = action.cooldown


func is_ready() -> bool:
	if not action:
		return false

	return time_left == 0.0


func elapse_cooldown(delta: float) -> void:
	if is_ready():
		return

	time_left = maxf(0.0, time_left - delta)
