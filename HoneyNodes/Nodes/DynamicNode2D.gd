class_name DynamicNode2D
extends Component2D


var velocity := Vector2.ZERO setget set_velocity,get_velocity


func set_velocity(value: Vector2) -> void:
	velocity = value


func get_velocity() -> Vector2:
	return velocity


func get_class() -> String:
	return "DynamicNode2D"
