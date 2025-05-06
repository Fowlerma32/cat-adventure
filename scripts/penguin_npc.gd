extends ShapeCast2D

func _process(delta):
	if is_colliding():
		for i in range(get_collision_count()):
			var collider = get_collider(i)
			if collider.name == "Player" and Input.is_action_just_pressed("start_dialogue"):
				BearQuest.start_quest()
				DialogueManager.show_dialogue_balloon(load("res://Dialogues/penguin_meet.dialogue"), "Meeting_Penguins")
			#else:
				#DialogueManager.show_dialogue_balloon(load("res://Dialogues/After_mquest.dialogue"), "start")
				#BearQuest.finish_quest()
