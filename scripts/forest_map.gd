extends Node

func _ready():
	$Player.position = Global.spawn_position  # Set player position


func _on_forest_to_main_transition_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = true
		var scene_path = "res://scenes/main_map.tscn"
		Global.spawn_position = Vector2(-405, 236)
		Global.current_scene = "MainMap"
		call_deferred("change_scene",scene_path)


func _on_forest_to_main_transition_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false



func _on_mini_game_body_entered(body: Node2D) -> void:
	if body is Player and Global.won_minigame1 == false:
		Global.transition_scene = true
		var scene_path = "res://scenes/mini_game.tscn"
		Global.spawn_position = Vector2(82, 3)
		call_deferred("change_scene",scene_path)
		

func _on_mini_game_body_exited(body: Node2D) -> void:
	if body is Player:
		Global.transition_scene = false

func change_scene(scene_path: String) -> void:
	if Global.transition_scene == true:
		get_tree().change_scene_to_file(scene_path)
		Global.finish_change_scene()
