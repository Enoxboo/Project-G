extends State
class_name EntityState

const HP_ZERO: StringName = &"hp_zero"
const HIT: StringName = &"hit"
const ATTACK: StringName = &"attack"

var entity: Entity


func _ready() -> void:
	await owner.ready
	entity = owner
