extends PanelContainer

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		get_tree().paused = false
		get_tree().reload_current_scene()
		LevelState.reset_all_states()
