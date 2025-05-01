#This script handles functions for the forest map
extends Node
#import paths for minimap
@onready var minimap = $Minimap
@onready var minimap_viewport := $Minimap/SubViewport
@onready var minimap_display := $Minimap/UI/TextureRect
@onready var minimap_camera := $Minimap/SubViewport/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = Global.spawn_position  # Set player position
	minimap.update_minimap() # Update minimap with new map's TileMaps
	minimap_viewport.size = Vector2(600,400) #adjust viewport size to show the map correctly
	minimap_camera.position += Vector2(160, 100) #adjust the camera position
	minimap_viewport.world_2d = World2D.new() #makes the viewport its own world
	minimap_display.texture = minimap_viewport.get_texture() #shows the minimap

#handles transitioning to the main map
func _on_forest_to_main_transition_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = true
		var scene_path = "res://scenes/main_map.tscn"
		Global.spawn_position = Vector2(-405, 236)
		Global.current_scene = "MainMap"
		call_deferred("change_scene",scene_path)

#handles exiting the transition area
func _on_forest_to_main_transition_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false


#handles entering the minigame
func _on_mini_game_body_entered(body: Node2D) -> void:
	if body is Player and Global.won_minigame1 == false:
		Global.transition_scene = true
		var scene_path = "res://scenes/mini_game.tscn"
		Global.spawn_position = Vector2(82, 3)
		call_deferred("change_scene",scene_path)
		
#handles exiting the minigame area
func _on_mini_game_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false

#handles scene changes
func change_scene(scene_path: String) -> void:
	if Global.transition_scene == true:
		get_tree().change_scene_to_file(scene_path)
		Global.finish_change_scene()
