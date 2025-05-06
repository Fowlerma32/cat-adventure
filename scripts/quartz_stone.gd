extends Area2D
var searchquest = SearchQuest
@export var stone_name := "quartz"  # Set this differently for each stone
var already_visited := false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and !already_visited:
		DialogueManager.show_dialogue_balloon(load("res://Dialogues/Quartz_info.dialogue"), "Quartz_info")
		await DialogueManager.dialogue_ended
		SearchQuest.register_stone_visited(stone_name)
		already_visited = true
