#This script holds functions that can be accessed by other scripts
#to ensure the quest log and the sort quest starts and finishes
class_name SortQuest extends QuestManager

#Variables for the quest log UI
var sort_quest_name: String = "Main Quest"
var sort_quest_description: String = "Go to the forest and sort the flowers"
var sort_reached_goal_text: String = "Return to the messenger"

#Called once the player talks to the NPC and starts the quest
func start_quest() -> void:
	if quest_status == QuestStatus.available:
		quest_status = QuestStatus.started
		print("Started Quest")
		#Update the QuestBox UI
		QuestBox.visible = true
		QuestTitle.text = sort_quest_name
		QuestDescription.text = sort_quest_description

#Check if quest component was reached
func reached_goal() -> void:
	if quest_status == QuestManager.QuestStatus.started:
		#update the status to reached goal
		quest_status = QuestManager.QuestStatus.reached_goal
		print("Reached Goal!")
		#update the QuestBox UI
		QuestDescription.text = sort_reached_goal_text
		
#Calls once the quest finishes and the player returns to the NPC
func finish_quest() -> void:
	if quest_status == QuestManager.QuestStatus.reached_goal:
		#update quest status to finished
		quest_status = QuestManager.QuestStatus.finished
		print("Finished Quest!")
		Global.update()
		#hides the QuestBox UI
		QuestBox.visible = false
		
