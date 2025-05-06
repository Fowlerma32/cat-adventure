extends Area2D

@export var stone_name := "diorite"
var already_visited := false

func _on_body_entered(body: Node2D):
	if body.is_in_group("Player") and !already_visited:
		var dialogue = load("res://Dialogues/diorite_info.dialogue")
		if dialogue:
			DialogueManager.show_dialogue_balloon(dialogue, "start")
			await DialogueManager.dialogue_ended
			SearchQuest.register_stone_visited(stone_name)
			already_visited = true
