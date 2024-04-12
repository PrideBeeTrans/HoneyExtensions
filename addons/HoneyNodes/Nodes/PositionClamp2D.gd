tool
class_name PositionClamp2D
extends Component

var actor_path := NodePath() setget set_actor_path,get_actor_path

onready var actor := get_node_or_null(actor_path) as Node2D setget set_actor,get_actor

var margin := 8

var left_border := 0
var right_border := OS.get_window_size().x as int
var up_border := 0
var down_border := OS.get_window_size().y as int


func _physics_process(delta: float) -> void:
	if actor == null:
		return
	var clamp_position_x := clamp(actor.global_position.x, left_border + margin, right_border - margin)
	var clamp_position_y := clamp(actor.global_position.y, up_border + margin, down_border - margin)
	
	actor.set_global_position(Vector2(clamp_position_x, clamp_position_y))


func set_actor_path(value: NodePath) -> void:
	actor_path = value


func get_actor_path() -> NodePath:
	return actor_path


func set_actor(value: Node2D) -> void:
	actor = value


func get_actor() -> Node2D:
	return actor


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"PositionClamp2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"actor_path","type":TYPE_NODE_PATH})
	properties.append({"name":"margin","type":TYPE_INT})
	return properties
