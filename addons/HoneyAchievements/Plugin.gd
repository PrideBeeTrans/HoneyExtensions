tool
extends EditorPlugin

const HONEY_ACHIEVEMENTS_NAME := "HoneyAchievements"
const HONEY_ACHIEVEMENTS_PATH := "res://addons/HoneyAchievements/Autoload/HoneyAchievements.gd"


func _enter_tree() -> void:
	add_autoload_singleton(HONEY_ACHIEVEMENTS_NAME, HONEY_ACHIEVEMENTS_PATH)


func _exit_tree() -> void:
	if Engine.has_singleton(HONEY_ACHIEVEMENTS_NAME):
		remove_autoload_singleton(HONEY_ACHIEVEMENTS_NAME)
