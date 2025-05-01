#This script contains the functions and variables for the player character.
class_name Player extends CharacterBody2D

var movement_speed = 100.0 

#get variable paths
@onready var PauseMenu = $PauseMenu

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pauseMenu"): #pause the game when 'ESC' is pressed
		pauseMenu()
		
#function for opening the pause menu
func pauseMenu():
	if Global.paused: #if paused and the user hits continue
		PauseMenu.hide() #hide the pause menu
		Engine.time_scale = 1 #set time back to normal
	else: #if the user opens the pause menu
		PauseMenu.show() #show the pause menu
		Engine.time_scale = 0 #stop time
	Global.paused = !Global.paused #set paused to the opposite after action is taken

func _physics_process(_delta: float) -> void:
	if Global.paused:
		return
	#This is now in messenger_2d_cast script
	#if Input.is_action_just_pressed("ui_accept"):
	#	DialogueManager.show_dialogue_balloon(load("res://Dialogues/Mquest_start.dialogue"),"start")
	#	return
	
	#sets the player's direction based on their input
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
	elif direction.y >0 || direction.y<0: #up or down
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle") #idle
	
	move_and_slide()
	
	#Testing testing 
	
