extends PlayerActionState


func update() -> void:
	if Input.is_action_just_pressed("spell_1"):
		transition.emit(CASTING, {"spell": player.spell_1})
		return
	elif Input.is_action_just_pressed("spell_2"):
		transition.emit(CASTING, {"spell": player.spell_2})
		return
