extends Control

@onready var player: CharacterBody2D = $"../"


func _on_continue_pressed() -> void:
	player.pauseMenu()

func _on_exit_pressed() -> void:
	get_tree().quit()
