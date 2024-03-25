tool
class_name Dragable2D
extends Area2D

var group_name := "" setget set_group_name,get_group_name
var dragging_input := "" setget set_dragging_input,get_dragging_input

var _touch_position := Vector2.ZERO setget _set_touch_position,_get_touch_position
var _dragging := false setget _set_dragging,_get_dragging


func _init() -> void:
	if Engine.is_editor_hint() == true or group_name == "":
		return
	add_to_group(group_name)
	
	
func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("input_event", self, "_on_input_event")


func _input(event: InputEvent) -> void:
	if not _get_dragging():
		return
	
	if event.is_action_released(get_dragging_input()):
		_set_dragging(false)
	
	
	if event is InputEventMouseMotion:
		position -= _get_touch_position() - (event.position)
		_set_touch_position(event.position)


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not InputMap.has_action(get_dragging_input()):
		return
	if event.is_action_pressed(get_dragging_input()):
		if _is_on_top() == true:
			_set_dragging(true)
			_set_touch_position(event.position)


func _is_on_top() -> bool:
	for dragable in get_tree().get_nodes_in_group(group_name + "hovered"):
		if dragable.get_index() > get_index():
			return false
	return true


func set_group_name(value: String) -> void:
	group_name = value


func get_group_name() -> String:
	return group_name


func set_dragging_input(value: String) -> void:
	dragging_input = value


func get_dragging_input() -> String:
	return dragging_input


func _set_touch_position(value: Vector2) -> void:
	_touch_position = value


func _get_touch_position() -> Vector2:
	return _touch_position


func _set_dragging(value: bool) -> void:
	_dragging = value


func _get_dragging() -> bool:
	return _dragging


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Dragable2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"group_name","type":TYPE_STRING})
	properties.append({"name":"dragging_input","type":TYPE_STRING})
	return properties
