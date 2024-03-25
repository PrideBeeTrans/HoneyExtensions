tool
class_name HitFlash2D
extends Component2D

var stats_path := NodePath() setget set_stats_path,get_stats_path

var flash_color : Color = Color.white setget set_flash_color,get_flash_color
var flash_modifier : float = 0.0 setget set_flash_modifier,get_flash_modifier

onready var stats := get_node_or_null(stats_path) as Node setget set_stats,get_stats


func _ready() -> void:
	if stats == null or Engine.is_editor_hint() == true:
		return
	_connect_signals()


func _connect_signals() -> void:
	_connect_stats()


func _connect_stats() -> void:
	stats.connect("damage_taken", self, "_on_damage_taken")


func _on_damage_taken(source: Area2D) -> void:
	pass


func set_flash_color(value: Color) -> void:
	flash_color = value
	get_material().set_shader_param("flash_color", flash_color)


func get_flash_color() -> Color:
	return flash_color


func set_flash_modifier(value: float) -> void:
	flash_modifier = value
	get_material().set_shader_param("flash_modifier", get_flash_modifier())


func get_flash_modifier() -> float:
	return flash_modifier


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
	properties.append({"name":"HitFlash2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"stats_path","type":TYPE_NODE_PATH})
	properties.append({"name":"flash_color","type":TYPE_COLOR})
	properties.append({"name":"flash_modifier","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
	return properties
