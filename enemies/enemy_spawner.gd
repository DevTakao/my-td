extends Marker2D

@export var ENEMY: Resource

@onready var TILEMAP = get_node("/root/Main/DefenderTileMapLayer")

const WAVE_DELAY = 10
var time_since_start = 0

const SPAWN_CHANCE = 10.0 / 100.0

func _on_spawn_ticker_timeout() -> void:
	if time_since_start <= WAVE_DELAY:
		time_since_start += 1
	else:
		var random = randf()
		var spawn_success = random <= SPAWN_CHANCE
		if spawn_success:
			spawn()
	
func spawn():
	print("spawn")
	var enemy = ENEMY.instantiate()
	enemy.position = position
	TILEMAP.add_child(enemy)
