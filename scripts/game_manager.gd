#This script will hold important variables for the reward system
extends Node
var main_map = null

func update():
	if main_map:
		var tilemap_layer = main_map.get_node("ForestReward")
		tilemap_layer.visible = true
		main_map.get_node("Minimap").update_minimap()
		main_map.get_node("RewardNPCs1").visible = true
