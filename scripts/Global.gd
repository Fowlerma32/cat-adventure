#This is a global script which holds our important global variables that need to be accessed
#by multiple different scripts.
extends Node

var current_scene = "MainMap" #current_scene keeps track of the current map
var transition_scene: bool = false #keeps track of when a transition is occuring
var paused: bool = false #keeps track of whether the game is paused or not
var main_map = null

var spawn_position: Vector2 = Vector2(145, -114) #handles where the player spawns

#Bool var that dictates whether the player has spoken to the messenger
var has_met_messenger: bool = false 
var finished_quest_text: bool = false

#Bool var that dicates whether the player finished the minigame
#ensures that the player cant play the minigame multiple times
var won_minigame1: bool = false

#Indicates whether the first quest has been finished
var finished_quest1: bool = false

#function to finish changing maps.
func finish_change_scene():
	if transition_scene == true:
		transition_scene = false

func update():
	if main_map:
		var tilemap_layer = main_map.get_node("ForestReward")
		tilemap_layer.visible = true
		main_map.get_node("Minimap").update_minimap()
		main_map.get_node("RewardNPCs1").visible = true
	
