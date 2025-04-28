class_name SortQuest extends QuestManager

#Variables for the quest log sort quest specific
var sort_quest_name: String = "Main Quest"
var sort_quest_description: String = "Go to the forest and sort the flowers"
var sort_reached_goal_text: String = "Return to the messenger"

#Starts the quest
func start_quest() -> void:
	if quest_status == QuestStatus.available:
		quest_status = QuestStatus.started
		print("Started Quest")
		#Update the QuestBox UI
		QuestBox.visible = true
		QuestTitle.text = sort_quest_name
		QuestDescription.text = sort_quest_description

#Check if quest component was completed
func reached_goal() -> void:
	if quest_status == QuestManager.QuestStatus.started:
		#update the status to reached goal
		quest_status = QuestManager.QuestStatus.reached_goal
		print("Reached Goal!")
		#Update the UI
		QuestDescription.text = sort_reached_goal_text
		
#Completing the quest
func finish_quest() -> void:
	if quest_status == QuestManager.QuestStatus.reached_goal:
		#Update quest status
		quest_status = QuestManager.QuestStatus.finished
		print("Finished Quest!")
		#Hiding the quest box
		QuestBox.visible = false
