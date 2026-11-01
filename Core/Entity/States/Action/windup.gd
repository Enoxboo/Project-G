extends ActionState

@onready var windup_timer: Timer = $WindupTimer
var action: ActionData


func enter(external_entries: Dictionary = {}) -> void:
	action = external_entries["action"]

	if action.windup_time > 0.0:
		windup_timer.start(action.windup_time)


func update() -> void:
	if not windup_timer.is_stopped():
		return

	do_action() #remplacer par transition.emit(ACTIVE)


func exit() -> void:
	action = null
	windup_timer.stop()


func do_action() -> void:
	print("Doing " + action.name)
	transition.emit(READY)
	return


func trigger_event(title: StringName, external_entries: Dictionary) -> void:
	super.trigger_event(title, external_entries)
	match title:
		EntityState.HIT:
			transition.emit(READY)
