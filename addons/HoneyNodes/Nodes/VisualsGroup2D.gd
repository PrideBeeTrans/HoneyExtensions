tool
class_name VisualsGroup2D
extends NodeCore2D

onready var start_scale := scale as Vector2 setget set_start_scale,get_start_scale

onready var _blink_tween := create_tween() as SceneTreeTween setget _set_blink_tween,_get_blink_tween
onready var _fade_in_tween := create_tween() as SceneTreeTween setget _set_fade_in_tween,_get_fade_in_tween
onready var _fade_out_tween := create_tween() as SceneTreeTween setget _set_fade_out_tween,_get_fade_out_tween
onready var _scale_tween := create_tween() as SceneTreeTween setget _set_scale_tween,_get_scale_tween
onready var _squash_tween := create_tween() as SceneTreeTween setget _set_squash_tween,_get_squash_tween
onready var _stretch_tween := create_tween() as SceneTreeTween setget _set_stretch_tween,_get_stretch_tween
onready var _tint_tween := create_tween() as SceneTreeTween setget _set_tint_tween,_get_tint_tween
onready var _rotation_tween := create_tween() as SceneTreeTween setget _set_rotation_tween,_get_rotation_tween
onready var _shift_tween := create_tween() as SceneTreeTween setget _set_shift_tween,_get_shift_tween


func flip_to(move_direction: Vector2,use_tween: bool = false,duration: float = 0.5,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	var flip_scale := Vector2(get_start_scale().x * move_direction.x, get_start_scale().y)
	if use_tween == false:
		if move_direction.x != 0:
			set_scale(flip_scale)
	else:
		scale_to(flip_scale, duration, trans_type, ease_type)


func shift_to(target_position: Vector2,duration: float = 0.5,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_shift_tween() != null and _get_shift_tween().is_running() == true:
		_get_shift_tween().kill()
	_set_shift_tween(create_tween().set_trans(trans_type).set_ease(ease_type))
	_get_shift_tween().tween_property(self, "position", target_position, duration)


func blink(times: int,speed_scale: float,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_blink_tween() != null and _get_blink_tween().is_running() == true:
		_get_blink_tween().kill()
	_set_blink_tween(create_tween().set_trans(trans_type).set_ease(ease_type).set_loops(times))
	_get_blink_tween().tween_property(self, "modulate", Color.transparent, speed_scale)
	_get_blink_tween().tween_property(self, "modulate", Color.white, speed_scale)


func fade_out(duration: float,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_fade_out_tween() != null and _get_fade_out_tween().is_running() == true:
		_get_fade_out_tween().kill()
	_set_fade_out_tween(create_tween().set_trans(trans_type).set_ease(ease_type))
	_get_fade_out_tween().tween_property(self, "modulate", Color.transparent, duration)


func fade_in(duration: float,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_fade_in_tween() != null and _get_fade_in_tween().is_running() == true:
		_get_fade_in_tween().kill()
	_set_fade_in_tween(create_tween().set_trans(trans_type).set_ease(ease_type))
	_get_fade_in_tween().tween_property(self, "modulate", Color.transparent, duration)


func squash(squash_speed: float,base_scale: Vector2 = Vector2.ONE,duration: float = 0.5,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_squash_tween() != null and _get_squash_tween().is_running() == true:
		_get_squash_tween().kill()
	_set_scale_tween(create_tween().set_trans(trans_type).set_ease(ease_type))
	_get_squash_tween().tween_property(self, "scale", base_scale, duration).from(Vector2(1+ squash_speed,1- squash_speed))


func stretch(stretch_speed: float,base_scale: Vector2 = Vector2.ONE,duration: float = 0.5,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_stretch_tween() != null and _get_stretch_tween().is_running() == true:
		_get_stretch_tween().kill()
	_set_scale_tween(create_tween().set_trans(trans_type).set_ease(ease_type))
	_get_stretch_tween().tween_property(self, "scale", base_scale, duration).from(Vector2(1- stretch_speed,1+ stretch_speed))


func scale_to(target_scale: Vector2,duration: float,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_scale_tween() != null and _get_scale_tween().is_running() == true:
		_get_scale_tween().kill()
	_set_scale_tween(create_tween().set_trans(trans_type).set_ease(ease_type))
	_get_scale_tween().tween_property(self, "scale", target_scale, duration)


func rotation_to(target_rotation: float,duration: float,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_rotation_tween() != null and _get_rotation_tween().is_running() == true:
		_get_rotation_tween().kill()
	_set_rotation_tween(create_tween().set_trans(trans_type).set_ease(ease_type))
	_get_rotation_tween().tween_property(self, "rotation_degrees", target_rotation, duration)


func tint_to(color_target: Color,duration: float,trans_type: int = Tween.TRANS_CUBIC,ease_type: int = Tween.EASE_IN_OUT) -> void:
	if _get_tint_tween() != null and _get_tint_tween().is_running() == true:
		_get_tint_tween().kill()
	_set_tint_tween(create_tween().set_trans(trans_type).set_ease(ease_type))
	_get_tint_tween().tween_property(self, "modulate", color_target, duration)


func set_start_scale(value: Vector2) -> void:
	start_scale = value


func get_start_scale() -> Vector2:
	return start_scale


func _set_blink_tween(value: SceneTreeTween) -> void:
	_blink_tween = value


func _get_blink_tween() -> SceneTreeTween:
	return _blink_tween


func _set_fade_in_tween(value: SceneTreeTween) -> void:
	_fade_in_tween = value


func _get_fade_in_tween() -> SceneTreeTween:
	return _fade_in_tween


func _set_fade_out_tween(value: SceneTreeTween) -> void:
	_fade_out_tween = value


func _get_fade_out_tween() -> SceneTreeTween:
	return _fade_out_tween


func _set_scale_tween(value: SceneTreeTween) -> void:
	_scale_tween = value


func _get_scale_tween() -> SceneTreeTween:
	return _scale_tween


func _set_squash_tween(value: SceneTreeTween) -> void:
	_squash_tween = value


func _get_squash_tween() -> SceneTreeTween:
	return _squash_tween


func _set_stretch_tween(value: SceneTreeTween) -> void:
	_stretch_tween = value


func _get_stretch_tween() -> SceneTreeTween:
	return _stretch_tween


func _set_tint_tween(value: SceneTreeTween) -> void:
	_tint_tween = value


func _get_tint_tween() -> SceneTreeTween:
	return _tint_tween


func _set_rotation_tween(value: SceneTreeTween) -> void:
	_rotation_tween = value


func _get_rotation_tween() -> SceneTreeTween:
	return _rotation_tween


func _set_shift_tween(value: SceneTreeTween) -> void:
	_shift_tween = value


func _get_shift_tween() -> SceneTreeTween:
	return _shift_tween
