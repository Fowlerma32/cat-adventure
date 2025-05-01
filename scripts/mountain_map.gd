#This script handles the mountain map functions
extends Node

#import paths for minimap
@onready var minimap = $Minimap
@onready var minimap_viewport := $Minimap/SubViewport
@onready var minimap_display := $Minimap/UI/TextureRect
@onready var minimap_camera := $Minimap/SubViewport/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = Global.spawn_position  # Set player position
	minimap.update_minimap()  # Update minimap with new map's TileMaps
	minimap_viewport.world_2d = World2D.new() #makes the viewport its own world
	minimap_viewport.size = Vector2(600,400) # sets the viewport size to correctly show the map
	minimap_camera.position += Vector2(160, 100) #adjusts the camera position
	minimap_display.texture = minimap_viewport.get_texture() #shows the minimap
	
#handles transition to the main map
func _on_mountain_to_main_transition_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = true
		var scene_path = "res://scenes/main_map.tscn"
		Global.spawn_position = Vector2(-455, -244)
		Global.current_scene = "MainMap"
		call_deferred("change_scene",scene_path)

#handles exiting the transition area
func _on_mountain_to_main_transition_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false

#handles changing scenes
func change_scene(scene_path: String) -> void:
	if Global.transition_scene == true:
		get_tree().change_scene_to_file(scene_path)
		Global.finish_change_scene()
