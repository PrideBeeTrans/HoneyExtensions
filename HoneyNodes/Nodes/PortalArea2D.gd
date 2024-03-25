tool
class_name PortalArea2D
extends Area2D

var target_portal_path := NodePath()

onready var target_portal := get_node_or_null(target_portal_path) as Node2D


func teleport(target: Node) -> void:
	target.set_global_position(target_portal.get_global_position())


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"PortalArea2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"target_portal_path","type":TYPE_NODE_PATH})
	return properties
