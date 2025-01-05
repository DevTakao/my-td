extends Panel

@export var TO_SPAWN: Resource
@export var COST: int = 0
@export var ICON: Resource

@onready var TILEMAP = get_node("/root/Main/TileMapLayer")

func _on_ready() -> void:
	$Label.text = str(COST)
	$Icon.texture = ICON
	
func _physics_process(delta: float) -> void:
	if LevelState.action == 'default' and $PickEffect.visible:
		hide_pick_effect()

func _on_gui_input(event: InputEvent) -> void:
	if LevelState.check_enough_essence(COST):
		if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
			LevelState.action = "picking_defender"
			LevelState.picked_defender = TO_SPAWN
			LevelState.pending_cost = COST
			show_pick_effect()

func show_pick_effect():
	$PickEffect.visible = true
	
func hide_pick_effect():
	$PickEffect.visible = false
