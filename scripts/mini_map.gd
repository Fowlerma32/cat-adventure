extends CanvasLayer

@onready var Minimap = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.paused:
		Minimap.visible = false
