extends Panel

@onready var GAME = get_node("/root/Main")
@onready var TILEMAP = get_node("/root/Main/TileMapLayer")
@onready var SPAWN_POINTS = get_children()

func _physics_process(delta: float) -> void:
	if GAME.action == "picking_defender":
		visible = true
	else:
		visible = false
		
func place_defender():
	var defender = GAME.picked_defender.instantiate()
	var click_position = get_global_mouse_position()
	
	var nearest_spawn = null
	for spawn_point in SPAWN_POINTS:
		if nearest_spawn == null or click_position.distance_to(spawn_point.global_position) < click_position.distance_to(nearest_spawn.global_position):
			nearest_spawn = spawn_point
	
	TILEMAP.add_child(defender)
	defender.global_position = nearest_spawn.global_position
	GAME.action = 'default'
	GAME.picked_defender = null
	GAME.spend_essence()

func _on_gui_input(event: InputEvent) -> void:
	if GAME.action == 'picking_defender':
		if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
			place_defender()
			
