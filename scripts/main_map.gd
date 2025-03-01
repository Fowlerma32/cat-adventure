extends Node

func _ready() -> void:
	$Player.position = Global.spawn_position  # Set player position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.spawn_position = Vector2(161, -29)
		call_deferred("change_scene", "res://scenes/forest_map.tscn")


func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
