extends Area2D
class_name Hitbox

signal hitbox_hit(hurtbox: Hurtbox)

@export var source: Entity
@export var element: Elements.Type = Elements.Type.NEUTRAL
@export var damage: int = 1
@export var status_data: StatusData
@export var stacks_per_hit: int = 1
@export var hitbox_memory: bool = true
@export var triggers_hit_reaction: bool = true

var hurtbox_list: Array[Hurtbox]


func _on_area_entered(hurtbox: Hurtbox) -> void:
	if hitbox_memory and hurtbox_list.has(hurtbox):
		return

	var attack: AttackDetails = AttackDetails.new()
	attack.source = source
	attack.element = element
	attack.damage = damage
	attack.status_data = status_data
	attack.stacks_per_hit = stacks_per_hit
	attack.direction = (hurtbox.global_position - global_position).normalized()
	attack.triggers_hit_reaction = triggers_hit_reaction

	if hitbox_memory:
		hurtbox_list.append(hurtbox)

	hurtbox.on_hit(attack)
	hitbox_hit.emit(hurtbox)
