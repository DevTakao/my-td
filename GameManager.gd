extends Node2D

const ACTION_TYPES = ['default', 'picking_defender']
var action = 'default'
var picked_defender = null

var collected_essence = 0
var pending_cost = 0

func check_enough_essence(cost: int):
	return collected_essence >= cost

func spend_essence():
	collected_essence -= pending_cost
	pending_cost = 0


func _on_game_over_area_game_over() -> void:
	%GameOverScreen.visible = true
	get_tree().paused = true
