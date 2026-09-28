extends State
class_name PlayerState

const IDLE = "Idle"
const RUN = "Run"

var player: Player


func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "PlayerState doit être utilisé uniquement dans la scène Player.")
