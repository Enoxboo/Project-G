extends Area2D
class_name Spell

var caster: Entity
var target_point: Vector2
var spell_data: SpellData


func setup(p_caster: Entity, p_target: Vector2, p_spell_data: SpellData) -> void:
	caster = p_caster
	target_point = p_target
	spell_data = p_spell_data


func _ready() -> void:
	collision_mask += Teams.get_spell_layer(caster.data.team)
	area_entered.connect(_on_spell_entered)


static func create(p_caster: Entity, p_target: Vector2, p_spell_data: SpellData, world: Node) -> void:
	var spell: Spell = p_spell_data.spell_scene.instantiate() as Spell
	assert(spell, "The instantiated scene is not a Spell.")

	spell.setup(p_caster, p_target, p_spell_data)
	world.add_child(spell)


func _on_spell_entered(area: Area2D) -> void:
	var spell: Spell = area as Spell
	if not spell:
		return
