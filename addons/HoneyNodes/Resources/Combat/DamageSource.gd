tool
class_name DamageSource
extends Data

var damage := 1 setget set_damage,get_damage
var is_hit_kill := false setget set_hit_kill,is_hit_kill


func set_damage(value: int) -> void:
	damage = value


func get_damage() -> int:
	return damage


func set_hit_kill(value: bool) -> void:
	is_hit_kill = value


func is_hit_kill() -> bool:
	return is_hit_kill


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"StartingStats","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"damage","type":TYPE_INT})
	properties.append({"name":"is_hit_kill","type":TYPE_BOOL})
	return properties
