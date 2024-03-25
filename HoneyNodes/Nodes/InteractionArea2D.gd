tool
class_name InteractionArea2D
extends Area2D

signal interacted()
signal interaction_available()
signal interaction_unavailable()

var interaction_input := ""


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("input_event", self, "_on_input_event")
	connect("area_entered", self, "_on_area_entered")
	connect("area_exited", self, "_on_area_exited")
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not InputMap.has_action(interaction_input):
		return
	if event.is_action_pressed(interaction_input):
		emit_signal("interacted")


func _on_area_entered(area: Area2D) -> void:
	emit_signal("interaction_available")


func _on_area_exited(area: Area2D) -> void:
	emit_signal("interaction_unavailable")


func _on_body_entered(body: Node2D) -> void:
	emit_signal("interaction_available")


func _on_body_exited(body: Node2D) -> void:
	emit_signal("interaction_unavailable")


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"InteractionArea2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"interaction_input","type":TYPE_STRING})
	return properties

