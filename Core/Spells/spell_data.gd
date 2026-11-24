extends ActionData
class_name SpellData

enum SpellType {
	BUFF,
	PROJECTILE,
	ZONE
}

@export var damage: int = 1
@export var element: Elements.Type
@export var status_data: StatusData
@export var stacks_per_hit: int = 1
@export var spell_type: SpellType
@export var speed: float = 500.0
@export var lifetime: float = 5.0
@export var piercing_total: int = 0
@export var destroyed_on_wall: bool = true
@export var triggers_hit_reaction: bool = true
