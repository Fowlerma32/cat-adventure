extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

var player_in_range = false  # Track if player is near

# Detect when the player enters the NPC area
func _on_body_entered(body):
	if body.is_in_group("Player"):  # Ensure only player triggers this
		player_in_range = true

# Detect when the player exits the NPC area
func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_in_range = false

# Check if Space is pressed when player is nearby
func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
