extends ActionState


func update() -> void:
	if entity.intent.action_1:
		transition.emit(WINDUP, {"action": entity.action_1})
		return
	elif entity.intent.action_2:
		transition.emit(WINDUP, {"action": entity.action_2})
		return
