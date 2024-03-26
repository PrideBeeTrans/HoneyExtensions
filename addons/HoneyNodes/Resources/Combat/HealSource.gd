class_name HealSource
extends Data

var amount := 0 setget set_amount,get_amount
var full_heal := false setget set_full_heal,is_full_heal


func set_amount(value: int) -> void:
	amount = value


func get_amount() -> int:
	return amount


func set_full_heal(value: bool) -> void:
	full_heal = value


func is_full_heal() -> bool:
	return full_heal 


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"HealSource","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"amount","type":TYPE_INT})
	properties.append({"name":"is_full_heal","type":TYPE_BOOL})
	return properties
