extends Control

const level_1 = preload("res://levels/level_1.tscn")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(level_1)
