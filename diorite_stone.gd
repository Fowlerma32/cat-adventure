extends Area2D

@export var stone_name := "diorite"
var already_visited := false
var quiz_passed := false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and !already_visited:
		DialogueManager.show_dialogue_balloon(load("res://Dialogues/Diorite_info.dialogue"), "Diorite_info")
		await DialogueManager.dialogue_ended
		SearchQuest.register_stone_visited(stone_name)
		already_visited = true
