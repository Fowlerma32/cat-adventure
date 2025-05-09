extends CanvasLayer
@onready var Minimap = $"."
@onready var player_marker = $SubViewport/PlayerMarker
@onready var messenger = $SubViewport/Messenger
@onready var main_exclamation = $SubViewport/MainExclamation
@onready var forest_exclamation = $SubViewport/ForestExclamation
@onready var mountain_exclamation = $SubViewport/MountainExclamation
@onready var player = get_node("../Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#set the pink square on the minimap to the player's position
	player_marker.position = player.global_position
	
	#handle placing exclamation points on the minimap
	if Global.current_scene == "MainMap":
		messenger.visible = true
		main_exclamation.visible = true
		forest_exclamation.visible = false
		mountain_exclamation.visible = false
		if !Global.has_met_messenger || (Global.won_minigame1 and !Global.finished_quest1_flow) || (Global.has_returned_rock and !Global.finished_quest2_flow) :
			main_exclamation.position = messenger.position
		elif !Global.won_minigame1 and Global.has_accepted_quest1 and !Global.finished_quest1_flow:
			main_exclamation.position = Vector2(-400,248)
		elif !Global.finished_second_minigame and Global.has_accepted_quest2:
			main_exclamation.position = Vector2(-454,-257)
		else:
			main_exclamation.visible = false
	elif Global.current_scene == "Forest":
		messenger.visible = false
		main_exclamation.visible = false
		mountain_exclamation.visible = false
		if !Global.won_minigame1 && Global.has_met_messenger:
			forest_exclamation.visible = true
			forest_exclamation.position = Vector2(55,3)
		elif Global.won_minigame1:
			forest_exclamation.visible = true
			forest_exclamation.position = Vector2(165,-57)
	elif Global.current_scene == "Mountain":
		messenger.visible = false
		mountain_exclamation.visible = true
		main_exclamation.visible = false
		forest_exclamation.visible = false
		if !Global.has_accepted_quest2 || Global.has_returned_rock:
			mountain_exclamation.position = Vector2(159,255)
		elif !Global.has_spoken_with_penguins || Global.has_picked_up_rock:
			mountain_exclamation.position = Vector2(401,170)
		elif !Global.has_spoken_with_bears:
			mountain_exclamation.position = Vector2(-121,144)
		else:
			mountain_exclamation.visible = false
		
		

func _ready() -> void:
	messenger.position = Vector2(93,-100) #sets the location of messenger

#copy TileMapLayers to the minimap
func copy_tilemaps_to_minimap(map_root: Node):
	for child in map_root.get_children():
		if child is TileMapLayer:
			var copy = child.duplicate()  # Deep copy
			#copy.visible = true  # Ensure it's visible in the viewport
			# Add to the SubViewport for minimap rendering
			$SubViewport.add_child(copy)

#clear TileMapLayers to allow for showing different maps' layers
func clear_minimap():
	for child in $SubViewport.get_children():
		# Check if the child is a TileMapLayer and not other nodes
		if child is TileMapLayer:
			child.queue_free() #remove them
			
# Update the minimap by clearing old maps and copying new ones
func update_minimap():
	clear_minimap()  # Clear previous TileMaps
	copy_tilemaps_to_minimap($"..")  # Copy new ones
	
