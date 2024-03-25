tool
class_name DropThruArea2D
extends Area2D

var target_path := NodePath() setget set_target_path,get_target_path

onready var target := get_node_or_null(target_path) as Node2D setget set_target,get_target


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("body_exited", self, "_on_body_exited")


func drop_thru() -> void:
	get_target().set_collision_mask_bit(get_collision_mask(), false)


func _on_body_exited(body: Node) -> void:
	get_target().set_collision_mask_bit(get_collision_mask(), true)


func set_target_path(value: NodePath) -> void:
	target_path = value


func get_target_path() -> NodePath:
	return target_path


func set_target(value: Node2D) -> void:
	target = value


func get_target() -> Node2D:
	return target


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"DropThruArea2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"target_path","type":TYPE_NODE_PATH})
	return properties
