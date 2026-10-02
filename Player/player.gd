extends CharacterBody2D
class_name Player

enum State {
	IDLE,
	RUN,
}
@export var data: PlayerData
var current_state: State = State.IDLE


func _ready() -> void:
	enter()


func _physics_process(_delta: float) -> void:
	var previous_state: State = current_state
	update()
	if current_state != previous_state:
		update()
	move_and_slide()


func enter() -> void:
	match current_state:
		State.IDLE:
			velocity = Vector2.ZERO
		State.RUN:
			pass


func update() -> void:
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	match current_state:
		State.IDLE:
			if not input_direction.is_zero_approx():
				change_state(State.RUN)
				return
		State.RUN:
			velocity = data.speed * input_direction
			if input_direction.is_zero_approx():
				change_state(State.IDLE)
				return


func exit() -> void:
	match current_state:
		State.IDLE:
			pass
		State.RUN:
			pass


func change_state(new_state: State) -> void:
	exit()
	current_state = new_state
	enter()
