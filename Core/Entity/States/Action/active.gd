extends ActionState


func enter(external_entries: Dictionary = {}) -> void:
	var slot: Slot = external_entries["slot"]

	var spell: Spell = slot.action.spell_scene.instantiate() as Spell
	assert(spell, "The instantiated scene is not a Spell.")

	slot.start_cooldown()
	spell.setup(entity, entity.intent.target_point, slot.action)
	get_tree().current_scene.add_child(spell)


func update() -> void:
	transition.emit(READY)
