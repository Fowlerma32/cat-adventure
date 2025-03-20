extends Control

@export var plant_scene: PackedScene
@onready var win_screen = $WinScreen

var total_plants = 4  # Total plants in the scene
var sorted_plants = 0  # Number of plants correctly sorted

# Function to be called when a plant is sorted
func on_plant_sorted():
	sorted_plants += 1
	if sorted_plants >= total_plants:
		show_win_screen()
		Global.won_minigame1 = true     #changes the mini game state to won
		change_scene()
		
# Function to change scenes
func change_scene():
	await get_tree().create_timer(1).timeout  # Optional: Small delay before switching
	get_tree().change_scene_to_file("res://scenes/forest_map.tscn")  # Change to the next scene

func show_win_screen():
	win_screen.visible = true

var plant_data = [
	{"name": "Foxglove", "texture": preload("res://assets/Foxglove.png"), "poisonous": true},
	{"name": "Tulip", "texture": preload("res://assets/Tulip.png"), "poisonous": true},
	{"name": "Fern", "texture": preload("res://assets/Fern.png"), "poisonous": false},
	{"name": "Snapdragon", "texture": preload("res://assets/Snapdragon.png"), "poisonous": false},
]

func _ready():
	var grid = $GridContainer
	for data in plant_data:
		var plant = plant_scene.instantiate()
		plant.plant_name = data["name"]
		plant.plant_texture = data["texture"]
		plant.is_poisonous = data["poisonous"]
		grid.add_child(plant)
