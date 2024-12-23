extends Marker2D

@onready var TILEMAP = get_node("/root/Main/DefenderTileMapLayer")

var spawn_queue = []

func add_to_spawn_queue(ENEMY):
	spawn_queue.push_back(ENEMY)

func spawn():
	if (spawn_queue.is_empty()):
		pass
	else:
		print("spawn")
		var ENEMY = spawn_queue.pop_front()
		var enemy = ENEMY.instantiate()
		enemy.position = position
		TILEMAP.add_child(enemy)


func _on_spawn_ticker_timeout() -> void:
	spawn()
