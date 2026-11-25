extends RefCounted
class_name Slot

var spell_data: SpellData
var time_left: float = 0.0
#var mutation


func fill_slot(p_spell_data: SpellData) -> void:
	spell_data = p_spell_data


func start_cooldown() -> void:
	time_left = spell_data.cooldown


func is_ready() -> bool:
	if not spell_data:
		return false

	return time_left == 0.0


func elapse_cooldown(delta: float) -> void:
	if is_ready():
		return

	time_left = maxf(0.0, time_left - delta)
