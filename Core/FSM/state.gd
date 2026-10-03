extends Node
class_name State

@warning_ignore("unused_signal")
signal transition(new_state: StringName, external_entries: Dictionary)


func enter(_external_entries: Dictionary = {}) -> void:
	pass


func update() -> void:
	pass


func exit() -> void:
	pass
