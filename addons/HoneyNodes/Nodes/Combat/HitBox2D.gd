tool
class_name HitBox2D
extends AreaCore2D

var stats_path := NodePath()

onready var stats := get_node_or_null(stats_path) as Node


func _ready() -> void:
	if Engine.is_editor_hint() == true:
		return
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(source: Area2D) -> void:
	if source.has_method("take_damage"):
		stats.take_damage(source)
	elif source.has_method("heal"):
		stats.heal(source)


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"HitBox2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"stats_path","type":TYPE_NODE_PATH})
	return properties
