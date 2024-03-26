tool
class_name Switch2D
extends InteractionArea2D

signal toggled(toggle)

var target_path := NodePath()
var target_method := ""

var _toggle := false setget _set_toggle,_get_toggle

onready var target := get_node_or_null(target_path) as Node2D


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("interacted", self, "_on_interacted")


func _set_toggle(value: bool) -> void:
	_toggle = value
	emit_signal("toggled", _toggle)


func _get_toggle() -> bool:
	return _toggle


func _on_interacted() -> void:
	if target.has_method(target_method):
		_set_toggle(not _get_toggle())
		target.call(target_method, _get_toggle())


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Switch2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"target_path","type":TYPE_NODE_PATH})
	properties.append({"name":"target_method","type":TYPE_STRING})
	return properties
