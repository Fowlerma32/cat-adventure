#This is a global script which holds our important global variables that need to be accessed
#by multiple different scripts.
extends Node

var current_scene = "MainMap" #current_scene keeps track of the current map
var transition_scene: bool = false #keeps track of when a transition is occuring
var paused: bool = false #keeps track of whether the game is paused or not

var spawn_position: Vector2 = Vector2(145, -114) #handles where the player spawns

#Bool var that dictates whether the player has spoken to the messenger
var has_met_messenger: bool = false

#Bool var that dictates whether the player has accepted the quest
var has_accepted_quest1: bool = false
var has_accepted_quest2: bool = false

#Did the finish quest text run yet
var finished_quest_text: bool = false
var finished_quest2_text: bool = false

var has_spoken_with_penguins = false
var has_spoken_with_bears = false
var has_picked_up_rock = false

var has_returned_rock: bool = false

var finished_quest1_flow: bool = false
var finished_quest2_flow: bool = false

#Bool var that dicates whether the player finished the minigame
#ensures that the player cant play the minigame multiple times
var won_minigame1: bool = false

var finished_second_minigame = false
#Indicates whether the first quest has been finished
var finished_quest1: bool = false

#function to finish changing maps.
func finish_change_scene():
	if transition_scene == true:
		transition_scene = false
