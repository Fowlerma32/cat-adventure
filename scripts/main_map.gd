extends Node

@onready var minimap_viewport := $Minimap/SubViewport
@onready var minimap_display := $Minimap/UI/TextureRect
@onready var minimap_camera := $Minimap/SubViewport/Camera2D

func _ready() -> void:
	$Player.position = Global.spawn_position  # Set player position

	minimap_viewport.world_2d = get_viewport().world_2d
	minimap_display.texture = minimap_viewport.get_texture()
	minimap_camera.position += Vector2(-100, -15)

func _on_main_to_forest_transition_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = true
		var scene_path = "res://scenes/forest_map.tscn"
		Global.spawn_position = Vector2(161, -29)
		Global.current_scene = "Forest"
		call_deferred("change_scene",scene_path)


func _on_main_to_forest_transition_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false


func _on_main_to_mountain_transition_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = true
		var scene_path = "res://scenes/mountain_map.tscn"
		Global.spawn_position = Vector2(162, 245)
		Global.current_scene = "Mountain"
		call_deferred("change_scene",scene_path)


func _on_main_to_mountain_transition_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false


func change_scene(scene_path: String) -> void:
	if Global.transition_scene == true:
		get_tree().change_scene_to_file(scene_path)
		Global.finish_change_scene()
