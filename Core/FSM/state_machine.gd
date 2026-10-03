extends Node
class_name StateMachine

@export var first_state: State
var current_state: State


func _ready() -> void:
	for child in get_children():
		if child is not State:
			continue

		if not first_state:
			first_state = child
		child.transition.connect(change_state)
	current_state = first_state
	await owner.ready
	current_state.enter()


func physics_update() -> void:
	var previous_state: State = current_state
	current_state.update()
	if current_state != previous_state:
		current_state.update()


func change_state(new_state: StringName, dictionary: Dictionary = {}) -> void:
	if not has_node(NodePath(new_state)):
		push_error("No State named : " + new_state)
		return

	current_state.exit()
	current_state = get_node(NodePath(new_state)) as State
	current_state.enter(dictionary)
