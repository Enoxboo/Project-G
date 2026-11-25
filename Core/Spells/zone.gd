extends Spell
class_name Zone

@onready var life_timer: Timer = $LifeTimer
@onready var hitbox: Hitbox = $Hitbox


func _ready() -> void:
	global_position = target_point

	hitbox.source = caster
	hitbox.element = data.element
	hitbox.damage = data.damage
	hitbox.status_data = data.status_data
	hitbox.stacks_per_hit = data.stacks_per_hit
	hitbox.hitbox_memory = false
	hitbox.collision_mask = Teams.get_opponent_hurtbox_layer(caster.data.team)
	hitbox.triggers_hit_reaction = data.triggers_hit_reaction
	hitbox.hit_on_contact = true

	collision_layer = Teams.get_spell_layer(caster.data.team)
	collision_mask = 0
	super._ready()

	life_timer.start(data.lifetime)


func _on_life_timer_timeout() -> void:
	queue_free()
