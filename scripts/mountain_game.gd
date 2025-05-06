#This file is for the second mini game

extends Node2D

@onready var dialogue_manager = $DialogueManager
@onready var search_quest = $SearchQuest

# Track quest progress
var penguin_talked = false
var bear_talked = false
var stones_examined = []
var required_stones = ["diorite", "granite", "marble", "quartz", "rose_quartz"]

func _ready():
	pass  

# When the player interacts with the penguin
func talk_to_penguin():
	if not penguin_talked:
		DialogueManager.show_dialogue_balloon(load("res://Dialogues/penguin_meeet.dialogue"), "start")
		search_quest.start_quest()
		penguin_talked = true
	elif search_quest.quest_status == QuestManager.QuestStatus.reached_goal:
		DialogueManager.show_dialogue_balloon(load("res://Dialogues/After_mquest.dialogue"), "start")
		search_quest.finish_quest()


# When the player interacts with the bear
func talk_to_bear():
	if penguin_talked and not bear_talked:
		DialogueManager.show_dialogue_balloon(load("res://Dialogues/Meeting_bears.dialogue"), "start")
		bear_talked = true


# When the player interacts with a stone
func examine_stone(stone_name: String):
	if stone_name in required_stones and stone_name not in stones_examined:
		stones_examined.append(stone_name)
		dialogue_manager.start_dialogue(stone_name)  # each stone has its own dialogue key
		if stone_name == "rose_quartz":
			search_quest.reached_goal()

# Example signal handler when body (player) enters penguin area
func _on_penguin_area_body_entered(body):
	if body.name == "Player":
		talk_to_penguin()

func _on_bear_area_body_entered(body):
	if body.name == "Player":
		talk_to_bear()

func _on_stone_area_body_entered(body, stone_name):
	if body.name == "Player":
		examine_stone(stone_name)
