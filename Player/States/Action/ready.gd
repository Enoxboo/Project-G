extends PlayerActionState


func update() -> void:
	if player.intent.spell_1:
		transition.emit(CASTING, {"spell": player.spell_1})
		return
	elif player.intent.spell_2:
		transition.emit(CASTING, {"spell": player.spell_2})
		return
