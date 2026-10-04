extends PlayerActionState

@onready var casting_timer: Timer = $CastingTimer
var spell: SpellData


func enter(external_entries: Dictionary = {}) -> void:
	spell = external_entries["spell"]

	if spell.casting_time > 0.0:
		casting_timer.start(spell.casting_time)


func update() -> void:
	if not casting_timer.is_stopped():
		return

	cast_spell()


func exit() -> void:
	spell = null
	casting_timer.stop()


func cast_spell() -> void:
	#TODO lancer le sort
	print("Cast " + spell.name)
	transition.emit(READY)
	return
