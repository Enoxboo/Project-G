class_name Teams

enum Team {
	PLAYER,
	ENEMY
}

const WALLS: int = 1
const PLAYER_COLLISION: int = 2
const PLAYER_HURTBOX: int = 4
const PLAYER_SPELL: int = 8
const ENEMY_COLLISION: int = 32
const ENEMY_HURTBOX: int = 64
const ENEMY_SPELL: int = 128


static func get_spell_layer(team: Team) -> int:
	var layer_value: int = 0
	match team:
		Team.PLAYER:
			layer_value = PLAYER_SPELL
		Team.ENEMY:
			layer_value = ENEMY_SPELL
	return layer_value


static func get_opponent_hurtbox_layer(team: Team) -> int:
	var layer_value: int = 0
	match team:
		Team.PLAYER:
			layer_value = ENEMY_HURTBOX
		Team.ENEMY:
			layer_value = PLAYER_HURTBOX
	return layer_value
