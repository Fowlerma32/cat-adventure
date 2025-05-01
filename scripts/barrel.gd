#This script is for handling the barrels in the first minigame. It sets up the two barrels
#poisonous and non-poisonous, and handles when the user "drops" the plants into them. 
extends Panel

@export var accepts_poisonous: bool = true  # True for Poisonous barrel, False for Non-Poisonous
@onready var label = $Label #creates the label variable so that later the text can be set
func _can_drop_data(_position, data):
	return "plant" in data  # Only accept plant objects

func _drop_data(_position, data):
	if data["is_poisonous"] == accepts_poisonous:
		print("Correct! You sorted:", data["plant"].plant_name)
		data["plant"].queue_free()  # Remove plant when correctly sorted
		get_parent().get_parent().on_plant_sorted()  # Notify Main scene
	else:
		print("Wrong! Try again.") 
				

#sets the label text for the barrels
func _ready():
	if accepts_poisonous:
		label.text = "Poisonous"
	else:
		label.text = "Non-Poisonous"
