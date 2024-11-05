extends StaticBody2D

@onready var ESSENCE = preload("res://essence.tscn")
@onready var GAME = get_node("/root/Main")
@onready var TILEMAP = get_node("/root/Main/TileMapLayer")

const COOLDOWN = 8
const MAX_COOLDOWN_BUFFER = 12
var time_since_last_produce = 0

func try_produce():
	# produce chance gradually increases after cooldown
	# 100% at total wait time of 20 seconds
	var extra_wait: float = time_since_last_produce - COOLDOWN
	var chance: float = extra_wait / MAX_COOLDOWN_BUFFER
	if randf() <= chance:
		var essence = ESSENCE.instantiate()
		essence.position = position
		TILEMAP.add_child(essence)
		time_since_last_produce = 0

func _on_produce_tick_timeout() -> void:
	# random chance to spawn essence after minimum cooldown
	time_since_last_produce += 1;
	if time_since_last_produce >= COOLDOWN:
		try_produce() 