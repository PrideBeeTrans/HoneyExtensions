class_name DynamicArea2D
extends Area2D


var velocity := Vector2.ZERO setget set_velocity,get_velocity


func set_velocity(value: Vector2) -> void:
	velocity = value


func get_velocity() -> Vector2:
	return velocity
