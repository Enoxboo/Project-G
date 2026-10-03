extends State
class_name PlayerState

const IDLE:= "Idle"
const RUN:= "Run"
const DASH:= "Dash"
const KNOCKBACK:= "Knockback"
const DEATH:= "Death"

var player: Player


func _ready() -> void:
	await owner.ready
	player = owner
