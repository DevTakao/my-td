extends Area2D

signal game_over

func _on_body_entered(body: Node2D) -> void:
	game_over.emit()
