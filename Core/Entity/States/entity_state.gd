extends State
class_name EntityState

var entity: Entity


func _ready() -> void:
	await owner.ready
	entity = owner
