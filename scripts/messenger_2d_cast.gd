extends ShapeCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#Called every frame when the player enters the messenger's ShapeCast
#func _process(delta):
	#if is_colliding():
		#for i in range(get_collision_count()):
			#var collider = get_collider(i)
			#if collider.name == "Player" and Input.is_action_just_pressed("start_dialogue"):
				#DialogueManager.show_dialogue_balloon(load("res://Dialogues/Messenger_Intro.dialogue"), "M_Intro")
			#elif Global.has_accepted_quest1:
				#Quest.start_quest()
			#elif Global.finished_quest_text:
				#Quest.finish_quest()
			#elif Global.has_accepted_quest2 == true:
				#BearQuest.start_quest()
			#elif Global.finished_quest2_text == true:
				#SearchQuest.finish_quest()
			#else:
				#pass

#func _process(delta):
	#if is_colliding():
		#for i in range(get_collision_count()):
			#var collider = get_collider(i)
			#if collider.name == "Player":
				#if Input.is_action_just_pressed("start_dialogue"):
					#DialogueManager.show_dialogue_balloon(load("res://Dialogues/Messenger_Intro.dialogue"), "M_Intro")
				#elif Global.has_accepted_quest1 == true:
					#Quest.start_quest()
				#elif Global.finished_quest_text == true:
					#Quest.finish_quest()
				#elif Global.has_accepted_quest2 == true:
					#BearQuest.start_quest()
				#elif Global.finished_quest2_text == true:
					#SearchQuest.finish_quest()
					
#func _process(delta):
	#if is_colliding():
		#for i in range(get_collision_count()):
			#var collider = get_collider(i)
			#if collider.name == "Player":
				#if Input.is_action_just_pressed("start_dialogue"):
					#DialogueManager.show_dialogue_balloon(load("res://Dialogues/Messenger_Intro.dialogue"), "M_Intro")
				#elif Global.finished_quest_text:
					#print("Global.finished_quest_text is:", Global.finished_quest_text)
					#Quest.finish_quest()
				#elif Global.has_accepted_quest1:
					#print("Global.has_accepted_quest1 is:", Global.has_accepted_quest1)
					#Quest.start_quest()
				#elif Global.has_accepted_quest2 == true:
					#print("Global.has_accepted_quest2 is:", Global.has_accepted_quest2)
					#BearQuest.start_quest()
				#elif Global.finished_quest2_text == true:
					#print("Global.finished_quest2_text is:", Global.finished_quest2_text)
					#SearchQuest.finish_quest()
					

func _process(delta):
	if is_colliding():
		for i in range(get_collision_count()):
			var collider = get_collider(i)
			if collider.name == "Player":
				if Input.is_action_just_pressed("start_dialogue"):
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/Messenger_Intro.dialogue"), "M_Intro")
				match Global.finished_quest_text:
					true:
						#print("Global.finished_quest_text is:", Global.finished_quest_text)
						Quest.finish_quest()
				match Global.has_accepted_quest1:
					true:
						#print("Global.has_accepted_quest1 is:", Global.has_accepted_quest1)
						Quest.start_quest()
				match Global.has_accepted_quest2:
					true:
						#print("Global.has_accepted_quest2 is:", Global.has_accepted_quest2)
						BearQuest.start_quest()
				match Global.finished_quest2_text:
					true:
						#print("Global.finished_quest2_text is:", Global.finished_quest2_text)
						SearchQuest.finish_quest()
