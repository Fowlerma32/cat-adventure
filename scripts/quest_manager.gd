class_name QuestManager extends Node2D

#Elements that show on screen for quests
@onready var QuestBox: CanvasLayer = GameManager.get_node('QuestBox')
@onready var QuestTitle: RichTextLabel = GameManager.get_node('QuestBox').get_node('QuestTitle')
@onready var QuestDescription: RichTextLabel = GameManager.get_node('QuestBox').get_node('QuestDescription')

@export_group("Quest Settings")
@export var quest_name: String #Name of the quest
@export var quest_description: String #Description Text
@export var reached_goal_text: String #Description after completing a quest component

#Quest statuses
enum QuestStatus{
	available,
	started,
	reached_goal,
	finished,
}

#Quest status
@export var quest_status: QuestStatus = QuestStatus.available
