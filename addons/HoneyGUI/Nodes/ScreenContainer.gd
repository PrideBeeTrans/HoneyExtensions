tool
class_name ScreenContainer
extends Control

var initial_screen_path := NodePath() setget set_initial_screen_path,get_initial_screen_path

onready var screen := get_node_or_null(initial_screen_path) as Control setget set_screen,get_screen


func _ready() -> void:
	change_screen(screen)


func change_screen(new_screen: Control,msg: Dictionary = {}) -> void:
	if get_screen() != null and get_screen().has_method("anim_out"):
		get_screen().anim_out()
	
	set_screen(new_screen)
	
	if get_screen() != null and get_screen().has_method("anim_in"):
		get_screen().anim_in()
		get_screen().enter(msg)


func set_initial_screen_path(value: NodePath) -> void:
	initial_screen_path = value


func get_initial_screen_path() -> NodePath:
	return initial_screen_path


func set_screen(value: Control) -> void:
	screen = value


func get_screen() -> Control:
	return screen


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"ScreenContainer","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"screen_path","type":TYPE_NODE_PATH})
	return properties
