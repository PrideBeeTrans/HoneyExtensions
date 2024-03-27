tool
class_name Stats
extends Node

var starting_stats : Resource = null setget set_starting_stats,get_starting_stats


func set_starting_stats(value: Resource) -> void:
	starting_stats = value
	property_list_changed_notify()
	update_configuration_warning()


func get_starting_stats() -> Resource:
	return starting_stats


func _get_configuration_warning() -> String:
	var warning := ""
	if get_starting_stats() != null and not get_starting_stats().has_method("get_max_health"):
		warning = "This not StartingStats"
	
	if get_starting_stats() == null:
		warning = "Is missing a StartingStats,consider setting one in the inspector."
	return warning


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Stats","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"starting_stats","type":TYPE_OBJECT})
	return properties
