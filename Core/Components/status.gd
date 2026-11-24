extends Node
class_name Status

signal status_damage_dealt(damage: int, status: StatusData)

var active_status: Array[ActiveStatus]


func _physics_process(delta: float) -> void:
	for i in range(active_status.size() - 1, -1, -1):
		var status: ActiveStatus = active_status[i]

		var status_damage: int = status.process_tick(delta)
		if status_damage > 0:
			status_damage_dealt.emit(status_damage, status.status_data)

		if status.ticks_left <= 0:
			active_status.remove_at(i)


func apply_status(status_data: StatusData, stacks: int) -> void:
	for status in active_status:
		if status.status_data == status_data:
			status.add_stacks(stacks)
			return

	var new_status: ActiveStatus = ActiveStatus.new()
	new_status.status_data = status_data
	new_status.add_stacks(stacks)
	active_status.append(new_status)


func remove_all_status() -> void:
	active_status.clear()
