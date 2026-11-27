extends Spell

@onready var life_timer: Timer = $LifeTimer
@onready var hitbox: Hitbox = $Hitbox

var direction: Vector2
var opponent_count: int = 0


func _ready() -> void:
	global_position = caster.global_position
	direction = (target_point - caster.global_position).normalized()

	hitbox.hitbox_hit.connect(_on_hitbox_hit)
	hitbox.source = caster
	hitbox.element = data.element
	hitbox.damage = data.damage
	hitbox.status_data = data.status_data
	hitbox.stacks_per_hit = data.stacks_per_hit
	hitbox.hitbox_memory = true
	hitbox.collision_mask = Teams.get_opponent_hurtbox_layer(caster.data.team)
	hitbox.triggers_hit_reaction = data.triggers_hit_reaction

	collision_layer = Teams.get_spell_layer(caster.data.team)
	collision_mask = Teams.WALLS if data.destroyed_on_wall else 0
	super._ready()

	life_timer.start(data.lifetime)


func _physics_process(delta: float) -> void:
	global_position += direction * data.speed * delta


func _on_life_timer_timeout() -> void:
	queue_free()


func _on_body_entered(_body: Node2D) -> void:
	if not data.destroyed_on_wall:
		return

	queue_free()


func _on_hitbox_hit(_hurtbox: Hurtbox) -> void:
	opponent_count += 1
	if opponent_count > data.piercing_total:
		queue_free()
