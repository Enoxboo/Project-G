extends State
class_name PlayerState

const IDLE = "Idle"
const RUN = "Run"

var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "PlayerState doit être utilisé uniquement dans la scène Player.")

func get_input_direction() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
