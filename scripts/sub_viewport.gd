extends SubViewport

@onready var player : CharacterBody2D = $"../../../Player"

@onready var camera_2d: Camera2D = $Camera2D

@onready var minimap: CanvasLayer = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world_2d = get_tree().root.world_2d

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.paused:
		minimap.visible = false
	else:
		minimap.visible = true
		camera_2d.global_position = player.global_position
	
