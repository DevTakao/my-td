extends Node2D

#references
var game_over_screen
var victory_screen

const ACTION_TYPES = ['default', 'picking_defender']
var action = 'default'
var picked_defender = null

var collected_essence = 25
var pending_cost = 0

func reset_all_states():
	game_over_screen.visible = false
	victory_screen.visible = false
	action = 'default'
	picked_defender = null
	collected_essence = 25
	pending_cost = 0

func check_enough_essence(cost: int):
	return collected_essence >= cost

func spend_essence():
	collected_essence -= pending_cost
	pending_cost = 0

func show_game_over() -> void:
	game_over_screen.visible = true
	get_tree().paused = true

func show_victory() -> void:
	victory_screen.visible = true
	get_tree().paused = true
	
func init_game_over_screen(node):
	game_over_screen = node

func init_victory_screen(node):
	victory_screen = node
