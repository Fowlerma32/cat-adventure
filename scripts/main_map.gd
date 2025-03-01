extends Node

func _ready() -> void:
	$Player.position = Global.spawn_position  # Set player position


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
