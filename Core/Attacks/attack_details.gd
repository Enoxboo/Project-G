extends RefCounted
class_name AttackDetails

var damage: int = 0
var direction: Vector2 = Vector2.ZERO
var element: Elements.Type = Elements.Type.NEUTRAL
var status_data: StatusData
var stacks_per_hit: int = 1
var source: Entity = null
var triggers_hit_reaction: bool = true
