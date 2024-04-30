tool
class_name HealSource
extends Data

var amount := 1 setget set_amount,get_amount
var has_received_full_heal := false setget set_received_full_heal,has_received_full_heal


func set_amount(value: int) -> void:
	amount = value


func get_amount() -> int:
	return amount


func set_received_full_heal(value: bool) -> void:
	has_received_full_heal = value


func has_received_full_heal() -> bool:
	return has_received_full_heal


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"StartingStats","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"amount","type":TYPE_INT})
	properties.append({"name":"has_received_full_heal","type":TYPE_BOOL})
	return properties
