extends Node
class_name StateMachine

@export var first_state: State
var current_state: State


func _ready() -> void:
	for child in get_children():
		if child is State:
			if not first_state:
				first_state = child
			child.transition.connect(change_state)

	assert(first_state, "Need at least one state in " + self.name)

	current_state = first_state
	await owner.ready
	current_state.enter()


func physics_update() -> void:
	if not current_state:
		return

	var previous_state: State = current_state
	current_state.update()
	if current_state != previous_state:
		current_state.update()


func change_state(new_state: StringName, dictionary: Dictionary = {}) -> void:
	assert(has_node(NodePath(new_state)), "No State named : " + new_state)

	current_state.exit()
	current_state = get_node(NodePath(new_state)) as State
	current_state.enter(dictionary)


func deliver_event(event_name: StringName, dictionary: Dictionary = {}) -> void:
	current_state.trigger_event(event_name, dictionary)
