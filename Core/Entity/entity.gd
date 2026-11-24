extends CharacterBody2D
class_name Entity

@export var data: EntityData
@export var controller: Controller
@export var actions: Array[ActionData]

var last_direction: Vector2 = Vector2.RIGHT
var intent: Intent = Intent.new()
var slots: Array[Slot]
var speed_multiplier: float = 1.0
var cooldown_multiplier: float = 1.0
var state_machines: Array[StateMachine]
var health: Health
var hurtbox: Hurtbox
var status: Status


func _ready() -> void:
	_connect_children()
	for i in actions.size():
		actions[i] = actions[i].duplicate() if actions[i] else null
		slots.append(Slot.new())
		slots[i].fill_slot(actions[i])
	intent.actions.resize(slots.size())


func _connect_children() -> void:
	for child in get_children():
		if child is StateMachine:
			state_machines.append(child)
		if child is Health:
			health = child
			child.hp_zero.connect(_on_hp_zero)
			child.health_changed.connect(_on_health_changed)
		if child is Hurtbox:
			hurtbox = child
			child.was_hit.connect(_on_hit)
		if child is Status:
			status = child
			child.status_damage_dealt.connect(_damaged_by_status)

	assert(controller, "Need a controller in " + self.name)
	assert(health, "Need a health in " + self.name)
	assert(hurtbox, "Need a hurtbox in " + self.name)
	assert(status, "Need a status in " + self.name)


func _physics_process(delta: float) -> void:
	controller.fill_intent(intent)
	for state_machine in state_machines:
		state_machine.physics_update()
	for slot in slots:
		if not slot.is_ready():
			slot.elapse_cooldown(delta * cooldown_multiplier)
	move_and_slide()


func _on_hp_zero() -> void:
	for state_machine in state_machines:
		state_machine.deliver_event(EntityState.HP_ZERO)


func _on_health_changed(_old_value: int, _new_value: int) -> void:
	#animation de dégat ou de soin
	pass


func _on_hit(attack: AttackDetails) -> void:
	for state_machine in state_machines:
		state_machine.deliver_event(EntityState.HIT, {EntityState.ATTACK: attack})
	health.take_damage(attack.damage)
	if attack.status_data:
		status.apply_status(attack.status_data, attack.stacks_per_hit)


func _damaged_by_status(damage: int, _status: StatusData) -> void:
	health.take_damage(damage)
