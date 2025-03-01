extends Node


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.spawn_position = Vector2(-405, 236)
		call_deferred("change_scene")

func change_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/main_map.tscn")
	
func _ready():
	$Player.position = Global.spawn_position  # Set player position
