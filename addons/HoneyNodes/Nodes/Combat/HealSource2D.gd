tool
class_name HealSource2D
extends Area2D

var heal_source : Resource = null setget set_heal_source,get_heal_source


func set_heal_source(value: Resource) -> void:
	heal_source = value


func get_heal_source() -> Resource:
	return heal_source


func get_class() -> String:
	return "HealSource2D"


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"HealSource2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"heal_source","type":TYPE_OBJECT})
	return properties
