extends Area2D
var searchquest = SearchQuest
@export var stone_name := "marble" 
var already_visited := false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and !already_visited:
		DialogueManager.show_dialogue_balloon(load("res://Dialogues/Marble_info.dialogue"), "Marble_info")
		await DialogueManager.dialogue_ended
		SearchQuest.register_stone_visited(stone_name)
		already_visited = true
