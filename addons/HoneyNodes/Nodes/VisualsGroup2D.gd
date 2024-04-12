class_name VisualsGroup2D
extends Component2D

onready var start_scale := get_scale() as Vector2


func flip_to(move_direction: Vector2) -> void:
	if move_direction.x != 0:
		var flip_scale := Vector2(move_direction.x * start_scale.x, start_scale.y)
		set_scale(flip_scale)
