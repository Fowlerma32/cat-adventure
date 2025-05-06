extends Area2D

@export var stone_name := "diorite"
var already_visited := false
var quiz_passed := false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and !already_visited:
		# First show the informational dialogue
		await show_dialogue_with_quiz()
		
		# Only register if quiz was passed
		if quiz_passed:
			SearchQuest.register_stone_visited(stone_name)
			already_visited = true

func show_dialogue_with_quiz():
	# Show the dialogue that contains the quiz
	DialogueManager.show_dialogue_balloon(load("res://Dialogues/Diorite_info.dialogue"), "Diorite_info")
	
	# Wait for the dialogue to complete
	await DialogueManager.dialogue_ended
	
	# Check if the player got the quiz right (you'll need to track this)
	# This assumes you have some way to know the quiz result
	quiz_passed = DialogueManager.get_variable("quiz_passed") 
	# Note: You'll need to set this variable in your dialogue file
