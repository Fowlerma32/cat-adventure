extends RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		var collider = get_collider()
		if collider.name == "Player" and Input.is_action_just_pressed("start_dialogue"):
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/Mquest_start.dialogue"), "start")
		return
