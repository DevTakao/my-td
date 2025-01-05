extends Panel

func _physics_process(delta: float) -> void:
	$Count.text = str(LevelState.collected_essence)
