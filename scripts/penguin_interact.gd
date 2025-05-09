extends Area2D

@export var bearQuest: Quest

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if bearQuest.quest_status == bearQuest.QuestStatus.available:
			bearQuest.start_quest()
			
		elif bearQuest.quest_status == bearQuest.QuestStatus.reached_goal:
			bearQuest.finish_quest()
