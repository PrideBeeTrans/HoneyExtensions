tool
class_name Dead2D
extends Spawner2D

var stats_path := NodePath() setget set_stats_path,get_stats_path

onready var stats := get_node_or_null(stats_path) as Node setget set_stats,get_stats


func _ready() -> void:
	if get_stats() == null or Engine.is_editor_hint() == true:
		return
	_connect_signals()


func _connect_signals() -> void:
	_connect_stats()


func _connect_stats() -> void:
	get_stats().connect("health_depleted", self, "_on_health_depleted")


func _on_health_depleted() -> void:
	pass


func set_stats_path(value: NodePath) -> void:
	stats_path = value


func get_stats_path() -> NodePath:
	return stats_path


func set_stats(value: Node) -> void:
	stats = value


func get_stats() -> Node:
	return stats


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Dead2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"stats_path","type":TYPE_NODE_PATH})
	return properties
