#This script handles the main map of the game.
extends Node

#import paths for minimap
@onready var minimap = $Minimap
@onready var minimap_viewport := $Minimap/SubViewport
@onready var minimap_display := $Minimap/UI/TextureRect
@onready var minimap_camera := $Minimap/SubViewport/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.main_map = self  # store reference to the main map
	$Player.position = Global.spawn_position  # Set player position	
	minimap.update_minimap()  # Update minimap with new map's TileMaps
	minimap_viewport.world_2d = World2D.new() #makes the viewport its own world
	minimap_display.texture = minimap_viewport.get_texture() #shows minimap
	minimap_camera.position += Vector2(-100, -15) #sets camera position properly

#handles player transition into forest map
func _on_main_to_forest_transition_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = true
		var scene_path = "res://scenes/forest_map.tscn" 
		Global.spawn_position = Vector2(161, -29)
		Global.current_scene = "Forest"
		call_deferred("change_scene",scene_path)

#handles exiting transition area
func _on_main_to_forest_transition_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false

#handles transition to mountain map
func _on_main_to_mountain_transition_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = true
		var scene_path = "res://scenes/mountain_map.tscn"
		Global.spawn_position = Vector2(162, 245)
		Global.current_scene = "Mountain"
		call_deferred("change_scene",scene_path)

#handles exiting transition area
func _on_main_to_mountain_transition_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false

#handles scene change
func change_scene(scene_path: String) -> void:
	if Global.transition_scene == true:
		get_tree().change_scene_to_file(scene_path)
		Global.finish_change_scene()
