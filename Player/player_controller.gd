extends Controller
class_name PlayerController


func fill_intent(intent: Intent) -> void:
	intent.movement_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	intent.target_point = get_global_mouse_position()
	intent.dash = Input.is_action_just_pressed("dash")
	intent.action_1 = Input.is_action_just_pressed("action_1")
	intent.action_2 = Input.is_action_just_pressed("action_2")
