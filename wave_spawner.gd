extends Node2D

const AXEMAN = preload("res://enemies/axe_man/axe_man.tscn")
var spawners = []

func _ready() -> void:
	var spawner1 = get_node("EnemySpawner")
	var spawner2 = get_node("EnemySpawner2")
	var spawner3 = get_node("EnemySpawner3")
	var spawner4 = get_node("EnemySpawner4")
	var spawner5 = get_node("EnemySpawner5")
	spawners = [spawner1, spawner2, spawner3, spawner4, spawner5]
	
const WAVE_DELAY = 30

const WAVE_1 = {
	"starts_at": WAVE_DELAY + 1,
	"mobs": [[AXEMAN, 1]]
}

const WAVE_2 = {
	"starts_at": WAVE_DELAY + 20,
	"mobs": [[AXEMAN, 2]]
}

const WAVE_3 = {
	"starts_at": WAVE_DELAY + 40,
	"mobs": [[AXEMAN, 5]]
}

const WAVE_4 = {
	"starts_at": WAVE_DELAY + 60,
	"mobs": [[AXEMAN, 10]]
}

const WAVE_5 = {
	"starts_at": WAVE_DELAY + 80,
	"mobs": [[AXEMAN, 5]]
}

const WAVES = [
	WAVE_1,
	WAVE_2,
	WAVE_3,
	WAVE_4,
	WAVE_5
]

var wave_index = 0
var seconds_passed = 0
var final_wave_index = len(WAVES) - 1

func _on_wave_timer_timeout() -> void:
	if (wave_index <= final_wave_index):
		seconds_passed += 1
		var next_wave = WAVES[wave_index]
		if (seconds_passed == next_wave.starts_at):
			summon_wave(next_wave)
			wave_index += 1

# wave_data looks like { "starts_at": 30, "mobs": [['axeman', 10]] }
func summon_wave(wave):
	for mob in wave.mobs:
		var remaining_spawn = mob[1]
		var spawned = 0;
		while remaining_spawn > 0:
			var spawner = spawners.pick_random()
			spawner.add_to_spawn_queue(mob[0])
			remaining_spawn -= 1
			spawned += 1
			print("spawn no.", spawned)
			
