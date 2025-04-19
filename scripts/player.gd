class_name Player extends CharacterBody2D

var movement_speed = 100.0

@onready var PauseMenu = $PauseMenu

@onready var animated_sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	Global.player = self     #added for quest connection

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pauseMenu"):
		pauseMenu()
		
func pauseMenu():
	if Global.paused:
		PauseMenu.hide()
		Engine.time_scale = 1
	else:
		PauseMenu.show()
		Engine.time_scale = 0
	Global.paused = !Global.paused

func _physics_process(_delta: float) -> void:
	if Global.paused:
		return
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_dialogue_balloon(load("res://Dialogues/Mquest_start.dialogue"),"start")
		return
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direction * movement_speed
	
	# Update animation based on movement direction
	if direction.x > 0: # Moving right
		animated_sprite.play("walk")
		animated_sprite.flip_h = true
	elif direction.x < 0: # Moving left
		animated_sprite.play("walk")
		animated_sprite.flip_h = false
	elif direction.y >0 || direction.y<0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	move_and_slide()
	
	#Testing testing 
	
