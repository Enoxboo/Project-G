extends Spell

@onready var life_timer: Timer = $LifeTimer
@onready var hitbox: Hitbox = $Hitbox

var direction: Vector2
var spell_data: SpellData
var opponent_count: int = 0


func _ready() -> void:
	global_position = caster.global_position
	direction = (target_point - caster.global_position).normalized()
	spell_data = action_data

	hitbox.hitbox_hit.connect(_on_hitbox_hit)
	hitbox.source = caster
	hitbox.element = spell_data.element
	hitbox.damage = spell_data.damage
	hitbox.status_data = spell_data.status_data
	hitbox.stacks_per_hit = spell_data.stacks_per_hit
	hitbox.hitbox_memory = true
	hitbox.collision_mask = Teams.get_opponent_hurtbox_layer(caster.data.team)

	collision_layer = Teams.get_spell_layer(caster.data.team)
	collision_mask = Teams.WALLS if spell_data.destroyed_on_wall else 0

	life_timer.start(spell_data.lifetime)


func _physics_process(delta: float) -> void:
	global_position += direction * spell_data.speed * delta


func _on_life_timer_timeout() -> void:
	queue_free()


func _on_body_entered(_body: Node2D) -> void:
	if not spell_data.destroyed_on_wall:
		return

	queue_free()


func _on_hitbox_hit(_hurtbox: Hurtbox) -> void:
	opponent_count += 1
	if opponent_count > spell_data.piercing_total:
		queue_free()
