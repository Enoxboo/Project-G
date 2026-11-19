extends Area2D
class_name Spell

var caster: Entity
var target_point: Vector2
var action_data: ActionData


func setup(p_caster: Entity, p_target: Vector2, p_action_data: ActionData) -> void:
	caster = p_caster
	target_point = p_target
	action_data = p_action_data
