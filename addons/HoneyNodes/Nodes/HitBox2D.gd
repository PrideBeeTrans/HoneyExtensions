tool
class_name HitBox2D
extends Area2D

signal hurt(source)
signal heal(source)

var stats_path := NodePath() setget set_stats_path,get_stats_path
var status_receiver_path := NodePath() setget set_status_receiver_path,get_status_receiver_path

onready var stats := get_node_or_null(stats_path) as Node setget set_stats,get_stats
onready var status_receiver := get_node_or_null(status_receiver_path) as Node2D setget set_status_receiver,get_status_receiver


func _ready() -> void:
	if Engine.is_editor_hint() == true:
		return
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(source: Area2D) -> void:
	if source.has_method("get_damage_source"):
		stats.take_damage(source)
		emit_signal("hurt", source)
	elif source.has_method("get_heal_source"):
		stats.heal(source)
		emit_signal("heal", source)


func set_stats_path(value: NodePath) -> void:
	stats_path = value
	update_configuration_warning()


func get_stats_path() -> NodePath:
	return stats_path


func set_status_receiver_path(value: NodePath) -> void:
	status_receiver_path = value
	update_configuration_warning()


func get_status_receiver_path() -> NodePath:
	return status_receiver_path


func set_stats(value: Node) -> void:
	stats = value
	update_configuration_warning()


func get_stats() -> Node:
	return stats


func set_status_receiver(value: Node2D) -> void:
	status_receiver = value
	update_configuration_warning()


func get_status_receiver() -> Node2D:
	return status_receiver


func _get_configuration_warning() -> String:
	var warning := ""
	if get_stats_path().is_empty() == true:
		warning = "Is missing a Stats, consider setting one in the inspector."
	if not get_stats_path().is_empty() and not get_node(get_stats_path()).has_method("set_health"):
		warning = "This not a Stats Component"
	return warning


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"HitBox2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"stats_path","type":TYPE_NODE_PATH})
	properties.append({"name":"status_receiver_path","type":TYPE_NODE_PATH})
	return properties
