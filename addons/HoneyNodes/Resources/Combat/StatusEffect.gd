tool
class_name StatusEffect
extends Data

var scene : PackedScene = null setget set_scene,get_scene
var duration := 0.0 setget set_duration,get_duration


func apply(target: Node) -> void:
	pass


func remove(target: Node) -> void:
	pass


func set_scene(value: PackedScene) -> void:
	scene = value


func get_scene() -> PackedScene:
	return scene


func set_duration(value: float) -> void:
	duration = value


func get_duration() -> float:
	return duration


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"StatusEffect","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"scene","type":TYPE_OBJECT,"hint":PROPERTY_HINT_RESOURCE_TYPE,"hint_string":"PackedScene"})
	properties.append({"name":"duration","type":TYPE_REAL})
	return properties
