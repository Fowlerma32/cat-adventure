class_name QuestOne extends QuestManager

var bear_quest_name: String = "Mountain Quest"
var bear_quest_description: String = "Go to the penguin side and speak with the penguins"
var bear_reached_goal_text: String = "Talk with the bears to hear their side of the story"

func start_quest() -> void:
	if quest_status == QuestStatus.available:
		quest_status = QuestStatus.started
		print("Started Bear Quest")
		QuestBox.visible = true
		QuestTitle.text = bear_quest_name
		QuestDescription.text = bear_quest_description

func reached_goal() -> void:
	if quest_status == QuestManager.QuestStatus.started:
		quest_status = QuestManager.QuestStatus.reached_goal
		print("Reached Bears!")
		QuestDescription.text = bear_reached_goal_text
		
func finish_quest() -> void:
	if quest_status == QuestManager.QuestStatus.reached_goal:
		quest_status = QuestManager.QuestStatus.finished
		print("Finished Bear Quest!")
		QuestBox.visible = false
