extends Area2D

signal game_over

@onready var GAME = get_node("/root/Main")

func _on_body_entered(body: Node2D) -> void:
	game_over.emit()
