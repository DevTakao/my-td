extends Panel

@onready var TO_SPAWN = get_child(0).INSTANCE;
@onready var GAME = get_node("/root/Main")
@onready var TILEMAP = get_node("/root/Main/TileMapLayer")

func _physics_process(delta: float) -> void:
	if GAME.action == 'default' and $PickEffect.visible:
		hide_pick_effect()

func _on_gui_input(event: InputEvent) -> void:
	if GAME.check_enough_essence($Spawner.COST):
		if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
			GAME.action = "picking_defender"
			GAME.picked_defender = TO_SPAWN
			GAME.pending_cost = $Spawner.COST
			show_pick_effect()

func show_pick_effect():
	$PickEffect.visible = true
	
func hide_pick_effect():
	$PickEffect.visible = false
