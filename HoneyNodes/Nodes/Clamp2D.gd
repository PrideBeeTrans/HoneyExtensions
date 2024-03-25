class_name Clamp2D
extends Component2D

export var actor_path := NodePath()
export var property := ""
export var limits := Rect2()

onready var _actor := get_node_or_null(actor_path) as Node2D


func clamped() -> void:
	var clamped_x := clamp(_actor.get(property).x, limits.position.x, limits.position.y)
	var clamped_y := clamp(_actor.get(property).y, limits.size.x, limits.size.y)
	_actor.set(property, Vector2(clamped_x, clamped_y))
