tool
class_name HitBox2D
extends Area2D

var stats_path := NodePath() setget set_stats_path,get_stats_path

onready var stats := get_node_or_null(stats_path) as Node setget set_stats,get_stats


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	if stats == null:
		return
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(source: Area2D) -> void:
	if source.has_method("get_damage_source"):
		stats.take_damage(source)
	elif source.has_method("get_heal_source"):
		stats.heal(source)


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
	properties.append({"name":"HitBox2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"stats_path","type":TYPE_NODE_PATH})
	return properties
