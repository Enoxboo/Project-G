extends ActionState

@onready var windup_timer: Timer = $WindupTimer
var slot: Slot


func enter(external_entries: Dictionary = {}) -> void:
	slot = external_entries["slot"]

	if slot.action.windup_time > 0.0:
		windup_timer.start(slot.action.windup_time)


func update() -> void:
	if not windup_timer.is_stopped():
		return

	transition.emit(ACTIVE, {"slot": slot})


func exit() -> void:
	slot = null
	windup_timer.stop()


func trigger_event(title: StringName, external_entries: Dictionary) -> void:
	super.trigger_event(title, external_entries)
	match title:
		EntityState.HIT:
			transition.emit(READY)
