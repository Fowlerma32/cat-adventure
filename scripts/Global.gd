extends Node

var current_scene = "MainMap"
var transition_scene: bool = false
var paused: bool = false

var spawn_position: Vector2 = Vector2(145, -114)

var player: Node = null #added for quest connection

#Bool var that dictates whether the player has spoken too the messenger
var has_met_messenger: bool = false

#Bool var that dicates whether the player finished the minigame
#ensures that the player cant play the minigame multiple times
var won_minigame1: bool = false

func finish_change_scene():
	if transition_scene == true:
		transition_scene = false
