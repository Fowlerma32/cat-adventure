extends Node

var current_scene = "MainMap"
var transition_scene = false

var spawn_position: Vector2 = Vector2.ZERO

func finish_change_scene():
	if transition_scene == true:
		transition_scene = false
