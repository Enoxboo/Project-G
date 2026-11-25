extends ActionState


func update() -> void:
	for i in entity.slots.size():
		if not entity.intent.spells[i]:
			continue

		if not entity.slots[i].is_ready():
			print_cooldown_debug(i)
			continue

		transition.emit(WINDUP, {"slot": entity.slots[i]})
		return


func print_cooldown_debug(spell_spot: int) -> void:
	if not entity.slots[spell_spot].spell_data:
		print("This spell is not assigned yet")
		return

	print(entity.slots[spell_spot].spell_data.name + " isn't ready yet. Cooldown left : " +
			str(entity.slots[spell_spot].time_left))
