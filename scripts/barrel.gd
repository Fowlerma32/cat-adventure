extends Panel

@export var accepts_poisonous: bool = true  # True for Poisonous barrel, False for Non-Poisonous
@onready var label = $Label
func _can_drop_data(_position, data):
	return "plant" in data  # Only accept plant objects

func _drop_data(_position, data):
	if data["is_poisonous"] == accepts_poisonous:
		print("Correct! You sorted:", data["plant"].plant_name)
		data["plant"].queue_free()  # Remove plant when correctly sorted
		get_parent().get_parent().on_plant_sorted()  # Notify Main scene
	else:
		print("Wrong! Try again.") 
				

func _ready():
	if accepts_poisonous:
		label.text = "Poisonous"
	else:
		label.text = "Non-Poisonous"
