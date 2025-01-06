extends Marker2D

@onready var TILEMAP = get_parent().get_parent().get_node("%DefenderTileMapLayer")
@onready var ENEMY_TILEMAP = get_parent().get_node("%Enemies")

var spawn_queue = []

func add_to_spawn_queue(ENEMY):
	spawn_queue.push_back(ENEMY)

func spawn():
	if (spawn_queue.is_empty()):
		pass
	else:
		var ENEMY = spawn_queue.pop_front()
		var enemy = ENEMY.instantiate()
		enemy.position = position
		ENEMY_TILEMAP.add_child(enemy)

func _on_spawn_ticker_timeout() -> void:
	spawn()
