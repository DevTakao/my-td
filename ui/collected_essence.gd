extends Panel

@onready var GAME = get_node("/root/Main")

func _physics_process(delta: float) -> void:
	$Count.text = str(GAME.collected_essence)
