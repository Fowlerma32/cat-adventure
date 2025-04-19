extends Node

@onready var minimap_viewport := $Minimap/SubViewport
@onready var minimap_display := $Minimap/UI/TextureRect
@onready var minimap_camera := $Minimap/SubViewport/Camera2D

func _ready():
	$Player.position = Global.spawn_position  # Set player position
	minimap_viewport.size = Vector2(600,400)
	minimap_camera.position += Vector2(160, 100)
	minimap_viewport.world_2d = get_viewport().world_2d
	minimap_display.texture = minimap_viewport.get_texture()
	
func _on_mountain_to_main_transition_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = true
		var scene_path = "res://scenes/main_map.tscn"
		Global.spawn_position = Vector2(-455, -244)
		Global.current_scene = "MainMap"
		call_deferred("change_scene",scene_path)


func _on_mountain_to_main_transition_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false

func change_scene(scene_path: String) -> void:
	if Global.transition_scene == true:
		get_tree().change_scene_to_file(scene_path)
		Global.finish_change_scene()
