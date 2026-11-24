extends RefCounted
class_name ActiveStatus

var status_data: StatusData
var current_stacks: int = 0
var ticks_left: int = 0
var time: float = 0.0


func add_stacks(stacks_added: int) -> void:
	current_stacks = mini(status_data.max_stacks, current_stacks + stacks_added)
	ticks_left = status_data.ticks_number


func process_tick(delta: float) -> int:
	if ticks_left <= 0:
		return 0

	time += delta

	if time >= status_data.time_between_ticks:
		time -= status_data.time_between_ticks
		ticks_left = maxi(0, ticks_left - 1)
		return status_data.damage_per_stack * current_stacks

	return 0
