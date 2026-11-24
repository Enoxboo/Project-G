extends Zone

var hurtbox_memory: Dictionary[Hurtbox, float]


func _ready() -> void:
	super._ready()

	hitbox.hit_on_contact = false
	hitbox.area_entered.connect(_on_area_entered)
	hitbox.area_exited.connect(_on_area_exited)


func _physics_process(delta: float) -> void:
	for hurtbox in hurtbox_memory:
		hurtbox_memory[hurtbox] += delta
		if hurtbox_memory[hurtbox] >= spell_data.time_between_ticks:
			hurtbox_memory[hurtbox] -= spell_data.time_between_ticks
			hitbox.hit_hurtbox(hurtbox)


func _on_area_entered(area: Area2D) -> void:
	var hurtbox: Hurtbox = area as Hurtbox
	if hurtbox:
		hurtbox_memory[hurtbox] = 0.0
		hitbox.hit_hurtbox(hurtbox)


func _on_area_exited(area: Area2D) -> void:
	var hurtbox: Hurtbox = area as Hurtbox
	if hurtbox:
		hurtbox_memory.erase(hurtbox)
