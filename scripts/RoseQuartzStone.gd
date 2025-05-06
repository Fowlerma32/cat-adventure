extends Area2D
var search_quest = SearchQuest
const ROSE_NAME := "rose_quartz"
var can_collect := false

func _ready():
	SearchQuest.stones_visited_changed.connect(_update_collectible)
	
func _update_collectible():
	can_collect = SearchQuest.stones_visited.size() >=4
	Global.finished_second_minigame = true
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player and can_collect:
		DialogueManager.show_dialogue_balloon(
			load("res://Dialogues/RoseQuartz_info.dialogue"), "RoseQuartz_info")
		await DialogueManager.dialogue_ended
		SearchQuest.register_stone_visited(ROSE_NAME)
		queue_free()
