extends Node2D

const PRODUCE = 25

func despawn():
	queue_free()

func _on_despawn_countdown_timeout() -> void:
	despawn()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		print("essence collected")
		despawn()
		if LevelState.collected_essence <= 9999:
			LevelState.collected_essence += PRODUCE
