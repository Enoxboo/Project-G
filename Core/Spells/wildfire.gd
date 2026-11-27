extends Zone


func _ready() -> void:
	super._ready()
	hitbox.hitbox_memory = true

	play_explosion()


func play_explosion() -> void:
	var tween := create_tween()

	tween.tween_property(self, "scale", Vector2(4.0, 4.0), data.lifetime * 0.6)
