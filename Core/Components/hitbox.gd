extends Area2D
class_name Hitbox

@export var damage: int = 1
@export var source: Entity


func _ready() -> void:
	if not source:
		await owner.ready
		source = owner


func _on_area_entered(hurtbox: Hurtbox) -> void:
	var attack: AttackDetails = AttackDetails.new()
	attack.damage = damage
	attack.direction = (hurtbox.global_position - global_position).normalized()
	attack.source = source
	hurtbox.on_hit(attack)
