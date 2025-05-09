class_name QuestSearch
extends QuestManager

signal stones_visited_changed

var search_quest_name: String = "Search Quest"
var search_quest_description: String = "Go and find pink quartz"
var search_reached_goal: String = "Give the pink quartz to the penguins"
var return_quartz: String = "Return to the messenger"

func start_quest() -> void:
	if quest_status == QuestStatus.available:
		quest_status = QuestStatus.started
		QuestBox.visible = true
		QuestTitle.text = search_quest_name
		QuestDescription.text = search_quest_description

		
func finish_quest() -> void:
	if quest_status == QuestManager.QuestStatus.reached_goal:
		quest_status = QuestManager.QuestStatus.finished
		print("Finished Quest!")
		QuestBox.visible = false

# Keep track of stones
var stones_visited := []
var required_stones := ["diorite", "granite", "marble", "quartz"] 
var has_rose_quartz := false

func register_stone_visited(stone_name:String) -> void:
	if stone_name in required_stones:
		if stone_name not in stones_visited:
			stones_visited.append(stone_name)
			emit_signal("stones_visited_changed")
			_update_quest_progress()
	elif stone_name =="rose_quartz":
		has_rose_quartz = true
		emit_signal("stones_visited_changed")
		reached_goal()
		
func _update_quest_progress() -> void:
	QuestDescription.text= "%s\n(Studied %d/4 stones)"% [search_quest_description, stones_visited.size()]
	
func reached_goal() -> void:
	if quest_status == QuestStatus.started && has_rose_quartz:
		quest_status = QuestStatus.reached_goal
		QuestDescription.text = search_reached_goal
		print("Ready to deliver rose quartz!")
		
func return_messenger() -> void:
	QuestDescription.text = return_quartz
	print("Return to the messenger!")
