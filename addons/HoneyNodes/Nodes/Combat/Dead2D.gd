tool
class_name Dead2D
extends Spawner2D

var stats_path := NodePath()

onready var stats := get_node_or_null(stats_path) as Node


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_stats()


func _connect_stats() -> void:
	if stats == null:
		return
	stats.connect("health_depleted", self, "spawn")


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Dead2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"stats_path","type":TYPE_NODE_PATH})
	return properties
