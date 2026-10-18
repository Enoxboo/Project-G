extends CharacterBody2D
class_name Entity

@export var data: EntityData
@export var controller: Controller
@export var action_1: ActionData
@export var action_2: ActionData

var last_direction: Vector2 = Vector2.RIGHT
var intent: Intent = Intent.new()
var speed_multiplier: float = 1.0
var state_machines: Array[StateMachine] = []


func _ready() -> void:
	for child in get_children():
		if child is StateMachine:
			state_machines.append(child)
		if child is Health:
			child.hp_zero.connect(_on_hp_zero)
			child.health_changed.connect(_on_health_changed)

	assert(controller, "Need a controller in " + self.name)


func _physics_process(_delta: float) -> void:
	controller.fill_intent(intent)
	for state_machine in state_machines:
		state_machine.physics_update()
	move_and_slide()


func _on_hp_zero() -> void:
	for state_machine in state_machines:
		state_machine.deliver_event(EntityState.HP_ZERO, {})


func _on_health_changed(_old_value: int, _new_value: int) -> void:
	#animation de dégat ou de soin
	pass
