tool
class_name Motion2D
extends NodeCore2D

var actor_path := NodePath() setget set_actor_path,get_actor_path

onready var actor := get_node_or_null(actor_path) as Node2D setget set_actor,get_actor

var move_data : Resource = null setget set_move_data,get_move_data
var direction := Vector2.ZERO setget set_direction,get_direction


func _physics_process(delta: float) -> void:
	if _can_move() == true:
		return
	actor.translate(direction * get_move_data().get_move_speed() * delta)


func _can_move() -> bool:
	return (Engine.is_editor_hint() == true 
	or get_move_data() == null 
	or direction == Vector2.ZERO
	or actor == null)


func set_actor_path(value: NodePath) -> void:
	actor_path = value


func get_actor_path() -> NodePath:
	return actor_path


func set_actor(value: Node2D) -> void:
	actor = value


func get_actor() -> Node2D:
	return actor


func set_move_data(value: Resource) -> void:
	move_data = value


func get_move_data() -> Resource:
	return move_data


func set_direction(value: Vector2) -> void:
	direction = value


func get_direction() -> Vector2:
	return direction


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Motion2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"actor_path","type":TYPE_NODE_PATH})
	properties.append({"name":"Physics","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"move_data","type":TYPE_OBJECT})
	properties.append({"name":"direction","type":TYPE_VECTOR2})
	return properties
