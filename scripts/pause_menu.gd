#This script contains the necessary functions for the pause menu
extends Control

@onready var player: CharacterBody2D = $"../" #gets the player's path

# When the continue button is pressed, resume
func _on_continue_pressed() -> void:
	player.pauseMenu()

# When exit is pressed, exit the game
func _on_exit_pressed() -> void:
	get_tree().quit()
