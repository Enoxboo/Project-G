extends Spell
class_name Zone

@onready var life_timer: Timer = $LifeTimer
@onready var hitbox: Hitbox = $Hitbox

var spell_data: SpellData


func _ready() -> void:
	global_position = target_point
	spell_data = action_data

	hitbox.source = caster
	hitbox.element = spell_data.element
	hitbox.damage = spell_data.damage
	hitbox.status_data = spell_data.status_data
	hitbox.stacks_per_hit = spell_data.stacks_per_hit
	hitbox.hitbox_memory = false
	hitbox.collision_mask = Teams.get_opponent_hurtbox_layer(caster.data.team)
	hitbox.triggers_hit_reaction = spell_data.triggers_hit_reaction
	hitbox.hit_on_contact = true

	collision_layer = Teams.get_spell_layer(caster.data.team)
	collision_mask = 0

	life_timer.start(spell_data.lifetime)


func _on_life_timer_timeout() -> void:
	queue_free()
