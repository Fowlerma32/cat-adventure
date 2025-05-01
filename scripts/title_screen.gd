#Script that contains functions for the titlescreen
extends Control

#When new game is pressed, start the game
func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_map.tscn")

#When quit is pressed, exit the game.
func _on_quit_pressed() -> void:
	get_tree().quit()
