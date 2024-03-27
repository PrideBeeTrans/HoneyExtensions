tool
class_name Gun2D
extends SpawnerCore2D


func shoot() -> void:
	pass


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Gun2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"scene","type":TYPE_OBJECT,"hint":PROPERTY_HINT_RESOURCE_TYPE,"hint_string":"PackedScene"})
	return properties
