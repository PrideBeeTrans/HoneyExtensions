tool
class_name HurtBox2D
extends Area2D

var damage_source : Resource = null setget set_damage_source,get_damage_source


func set_damage_source(value: Resource) -> void:
	damage_source = value


func get_damage_source() -> Resource:
	return damage_source


func get_class() -> String:
	return "HurtBox2D"


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"HurtBox2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"damage_source","type":TYPE_OBJECT})
	return properties
