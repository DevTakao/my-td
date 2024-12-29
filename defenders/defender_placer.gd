extends Panel

@onready var GAME = get_node("/root/Main")
@onready var TILEMAP = get_node("/root/Main/DefenderTileMapLayer")

func finish_picking_defender():
	GAME.action = 'default'
	GAME.picked_defender = null
	GAME.spend_essence()

func _physics_process(delta: float) -> void:
	if GAME.action == "picking_defender":
		visible = true
	else:
		visible = false

func get_clicked_cell():
	var click_position = TILEMAP.get_local_mouse_position()
	var clicked_cell = TILEMAP.local_to_map(click_position)
	return clicked_cell
	
func add_defender_to_cell(defender: Node, cell: Vector2i):
	if cell is Vector2i:
		var cell_position = TILEMAP.map_to_local(cell)
		defender.position = cell_position
		TILEMAP.add_child(defender)
	else:
		print("Invalid cell")

func place_defender():
	var defender = GAME.picked_defender.instantiate()
	var cell = get_clicked_cell()
	add_defender_to_cell(defender, cell)
	finish_picking_defender()

func _on_gui_input(event: InputEvent) -> void:
	if GAME.action == 'picking_defender':
		if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
			place_defender()
