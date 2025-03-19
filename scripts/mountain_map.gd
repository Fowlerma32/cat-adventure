extends Node

func _ready():
	$Player.position = Global.spawn_position  # Set player position

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
