extends ShapeCast2D

func _process(delta):
	if is_colliding():
		for i in range(get_collision_count()):
			var collider = get_collider(i)
			if collider.name == "Player" and Input.is_action_just_pressed("start_dialogue"):
				SearchQuest.start_quest()
				DialogueManager.show_dialogue_balloon(load("res://Dialogues/Meeting_Bears.dialogue"), "Meeting_Bears")
			else:
				SearchQuest.finish_quest()
