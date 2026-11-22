extends ActionState


func enter(external_entries: Dictionary = {}) -> void:
	var action: ActionData = external_entries["action"]

	var spell: Spell = action.spell_scene.instantiate() as Spell
	assert(spell, "The instantiated scene is not a Spell.")

	spell.setup(entity, entity.intent.target_point, action)
	get_tree().current_scene.add_child(spell)


func update() -> void:
	transition.emit(READY)
