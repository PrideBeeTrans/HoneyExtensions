tool
class_name HitBox2D
extends Area2D

signal collided(area)

var target_path := NodePath("..") setget set_target_path,get_target_path
var stats_path := NodePath() setget set_stats_path,get_stats_path
var status_receiver_path := NodePath() setget set_status_receiver_path,get_status_receiver_path

onready var target := get_node(target_path) as Node2D setget set_target,get_target
onready var stats := get_node_or_null(stats_path) as Node setget set_stats,get_stats
onready var status_receiver := get_node_or_null(status_receiver_path) as Node2D setget set_status_receiver,get_status_receiver


func _ready() -> void:
	if get_stats() == null:
		return
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("get_damage_source"):
		get_stats().take_damage(area)
	elif area.has_method("get_heal_source"):
		get_stats().heal(area)
	elif area.has_method("teleport"):
		area.teleport(get_target())
	emit_signal("collided", area)


func set_target_path(value: NodePath) -> void:
	target_path = value


func get_target_path() -> NodePath:
	return target_path


func set_target(value: Node2D) -> void:
	target = value


func get_target() -> Node2D:
	return target


func set_stats_path(value: NodePath) -> void:
	stats_path = value


func get_stats_path() -> NodePath:
	return stats_path


func set_stats(value: Node) -> void:
	stats = value


func get_stats() -> Node:
	return stats


func set_status_receiver_path(value: NodePath) -> void:
	status_receiver_path = value


func get_status_receiver_path() -> NodePath:
	return status_receiver_path


func set_status_receiver(value: Node2D) -> void:
	status_receiver = value


func get_status_receiver() -> Node2D:
	return status_receiver


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"HitBox2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"target_path","type":TYPE_NODE_PATH})
	properties.append({"name":"stats_path","type":TYPE_NODE_PATH})
	properties.append({"name":"status_receiver_path","type":TYPE_NODE_PATH})
	return properties
