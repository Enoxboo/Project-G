extends Area2D
class_name Spell

var caster: Entity
var target_point: Vector2
var data: SpellData
var locked: bool = false


func setup(entity: Entity, target: Vector2, spell_data: SpellData) -> void:
	caster = entity
	target_point = target
	data = spell_data


func _ready() -> void:
	collision_mask += Teams.get_spell_layer(caster.data.team)
	area_entered.connect(_on_spell_entered)


static func create(entity: Entity, target: Vector2, spell_data: SpellData, world: Node) -> void:
	var spell: Spell = spell_data.spell_scene.instantiate() as Spell
	assert(spell, "The instantiated scene is not a Spell.")

	spell.setup(entity, target, spell_data)
	world.add_child(spell)


func _on_spell_entered(area: Area2D) -> void:
	var spell: Spell = area as Spell
	if not spell:
		return
	if spell.locked or locked:
		return
	if spell.data == data:
		return
	if not spell.data.can_combo or not data.can_combo:
		return
	if get_instance_id() < spell.get_instance_id():
		return

	var combo: SpellData = RecipeBook.find_combo(data, spell.data)
	if combo:
		_perform_combo(spell, combo)


func _perform_combo(spell: Spell, combo: SpellData) -> void:
	var middle: Vector2 = (global_position + spell.global_position) / 2.0
	var world: Node = get_tree().current_scene

	locked = true
	spell.locked = true

	Spell.create.call_deferred(caster, middle, combo, world)

	spell.queue_free()
	queue_free()
