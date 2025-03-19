extends VBoxContainer

@export var plant_name: String = "Plant Name"
@export var plant_texture: Texture
@export var is_poisonous: bool = false

@onready var texture_rect = $TextureRect
@onready var label = $Label


func _ready():
	texture_rect.texture = plant_texture
	label.text = plant_name

# Start dragging when the user clicks and moves the image
func _get_drag_data(_position):
	var drag_preview = TextureRect.new()
	drag_preview.texture = texture_rect.texture
	drag_preview.custom_minimum_size = Vector2(50, 50)  # Set preview size
	set_drag_preview(drag_preview)  # Show image while dragging
	return {"plant": self, "is_poisonous": is_poisonous}
