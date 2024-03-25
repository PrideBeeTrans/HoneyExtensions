tool
class_name BorderBounce2D
extends Component2D

signal bounced()

var margin := 8
var actor_path := NodePath()
var physics_behaviour_path := NodePath()

var _left_border := 0
var _right_border := ProjectSettings.get_setting("display/window/size/width") as int

var _up_border := 0
var _bottom_border := ProjectSettings.get_setting("display/window/size/height") as int

onready var _actor := get_node_or_null(actor_path) as Node2D
onready var _physics_behaviour := get_node_or_null(physics_behaviour_path) as Node2D


func apply_bounce() -> void:
	if _actor.get_global_position().x < _left_border + margin:
		_actor.global_position.x = _left_border + margin
		_physics_behaviour.set_velocity(_physics_behaviour.get_velocity().bounce(Vector2.RIGHT))
		emit_signal("bounced")
	
	elif _actor.get_global_position().x > _right_border - margin:
		_actor.global_position.x = _right_border - margin
		_physics_behaviour.acceleration_on_floating(_physics_behaviour.get_velocity().bounce(Vector2.LEFT))
		emit_signal("bounced")
	
	elif _actor.get_global_position().y < _up_border + margin:
		_actor.global_position.y = _up_border + margin
		_physics_behaviour.acceleration_on_floating(_physics_behaviour.get_velocity().bounce(Vector2.DOWN))
		emit_signal("bounced")
	
	elif _actor.get_global_position().y > _bottom_border - margin:
		_actor.global_position.y = _bottom_border - margin
		_physics_behaviour.acceleration_on_floating(_physics_behaviour.get_velocity().bounce(Vector2.UP))
		emit_signal("bounced")


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"BounceBorder2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"margin","type":TYPE_INT})
	properties.append({"name":"actor_path","type":TYPE_NODE_PATH})
	properties.append({"name":"physics_behaviour_path","type":TYPE_NODE_PATH})
	return properties
