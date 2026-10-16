extends Controller
class_name EnemyController

var target: Entity


func _ready() -> void:
	target = get_tree().get_first_node_in_group("Player")


func fill_intent(intent: Intent) -> void:
	if target:
		var target_direction: Vector2 = (target.global_position - global_position).normalized()
		intent.movement_direction = target_direction
