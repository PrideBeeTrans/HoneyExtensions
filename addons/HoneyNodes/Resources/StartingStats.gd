tool
class_name StartingStats
extends Resource

var max_health := 1 setget set_max_health,get_max_health


func set_max_health(value: int) -> void:
	max_health = value


func get_max_health() -> int:
	return max_health


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"StartingStats","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"max_health","type":TYPE_INT})
	return properties
