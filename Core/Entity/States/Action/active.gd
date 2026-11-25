extends ActionState


func enter(external_entries: Dictionary = {}) -> void:
	var slot: Slot = external_entries["slot"]
	Spell.create(entity, entity.intent.target_point, slot.action, get_tree().current_scene)
	slot.start_cooldown()


func update() -> void:
	transition.emit(READY)
