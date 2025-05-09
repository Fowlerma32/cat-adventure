extends ShapeCast2D

func _process(delta):
	if is_colliding():
		for i in range(get_collision_count()):
			var collider = get_collider(i)
			if collider.name == "Player" and Input.is_action_just_pressed("start_dialogue") and !Global.finished_second_minigame:
				#BearQuest.start_quest()
				DialogueManager.show_dialogue_balloon(load("res://Dialogues/penguin_meet.dialogue"), "Meeting_Penguins")
			#else:
				#DialogueManager.show_dialogue_balloon(load("res://Dialogues/After_mquest.dialogue"), "After_mquest")
				#BearQuest.finish_quest()
			elif collider.name == "Player" and Input.is_action_just_pressed("start_dialogue") and Global.finished_second_minigame:
				DialogueManager.show_dialogue_balloon(load("res://Dialogues/After_mquest.dialogue"), "Finishing_quest")
				Global.finished_quest2_text = true
				#SearchQuest.finish_quest()
			elif Global.has_returned_rock == true:
				SearchQuest.return_messenger()
			else:
				pass
				
