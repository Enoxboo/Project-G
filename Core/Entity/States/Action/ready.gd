extends ActionState


func update() -> void:
	for i in entity.slots.size():
		if not entity.intent.actions[i]:
			continue

		if not entity.slots[i].is_ready():
			print_cooldown_debug(i)
			continue

		transition.emit(WINDUP, {"slot": entity.slots[i]})
		return


func print_cooldown_debug(action_spot: int) -> void:
	if not entity.slots[action_spot].action:
		print("This action is not assigned yet")
		return

	print(entity.slots[action_spot].action.name + " isn't ready yet. Cooldown left : " +
			str(entity.slots[action_spot].time_left))
