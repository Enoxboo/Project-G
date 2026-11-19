extends Area2D
class_name Hitbox

signal hitbox_hit(hurtbox: Hurtbox)

@export var source: Entity
@export var element: Elements.Type = Elements.Type.NEUTRAL
@export var damage: int = 1
@export var hitbox_memory: bool = true

var hurtbox_list: Array[Hurtbox] = []


func _on_area_entered(hurtbox: Hurtbox) -> void:
	if hitbox_memory and hurtbox_list.has(hurtbox):
		return

	var attack: AttackDetails = AttackDetails.new()
	attack.source = source
	attack.element = element
	attack.damage = damage
	attack.direction = (hurtbox.global_position - global_position).normalized()

	if hitbox_memory:
		hurtbox_list.append(hurtbox)

	hurtbox.on_hit(attack)
	hitbox_hit.emit(hurtbox)
