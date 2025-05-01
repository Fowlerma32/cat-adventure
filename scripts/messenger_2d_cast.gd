extends ShapeCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#Called every frame when the player enters the messenger's ShapeCast
func _process(delta):
	if is_colliding():
		for i in range(get_collision_count()):
			var collider = get_collider(i)
			if collider.name == "Player" and Input.is_action_just_pressed("start_dialogue"):
				Quest.start_quest()
				DialogueManager.show_dialogue_balloon(load("res://Dialogues/Mquest_start.dialogue"), "start")
			else:
				Quest.finish_quest()
