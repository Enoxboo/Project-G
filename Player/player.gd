extends CharacterBody2D
class_name Player

@export var data: PlayerData

func _physics_process(_delta: float) -> void:
	move_and_slide()
