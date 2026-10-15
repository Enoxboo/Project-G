extends Controller
class_name PlayerController


func fill_intent(intent: Intent) -> void:
	intent.movement_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	intent.target_point = get_global_mouse_position()
	intent.dash = Input.is_action_just_pressed("dash")
	intent.spell_1 = Input.is_action_just_pressed("spell_1")
	intent.spell_2 = Input.is_action_just_pressed("spell_2")
