class_name HoneyProperty
extends HoneyEaser

var _target : Object setget _set_target,_get_target
var _property := NodePath() setget _set_property,_get_property
var _from setget _set_from,_get_from
var _to setget _set_to,_get_to
var _is_from := true setget _set_is_from,_get_is_from
var _as_relative := false setget _set_as_relative,_get_as_relative


func _init(target: Object,property: NodePath,to_value,duration: float) -> void:
	_set_target(target)
	_set_property(property)
	_set_from(_get_target().get_indexed(_get_property()))
	_set_to(to_value)
	_set_duration(duration)
	

func _easing_step() -> void:
	var time_normalized := _get_time_normalized()
	var easing_value = _get_from() + (_get_to() - _get_from()) * time_normalized
	_set_target_value(_get_property(), easing_value)


func from(value) -> HoneyProperty:
	_set_from(value)
	_set_is_from(false)
	return self


func from_current() -> HoneyProperty:
	_set_is_from(false)
	return self


func as_relative() -> HoneyProperty:
	_set_as_relative(true)
	return self


func _check_loop_type() -> void:
	if _get_loop_type() == LoopTypes.Restart:
		_set_target_value(_get_property(), _get_from())
	elif _get_loop_type() == LoopTypes.YoyoYoyo:
		var old_from = _get_from()
		var old_to = _get_to()
		_set_to(old_from)
		_set_from(old_to)
		_set_target_value(_get_property(), _get_from())


func _set_target(value: Object) -> void:
	_target = value


func _get_target() -> Object:
	return _target


func _set_property(value: NodePath) -> void:
	_property = value


func _get_property() -> NodePath:
	return _property


func _set_target_value(property: NodePath,value) -> void:
	_get_target().set(property, value)


func _set_from(value) -> void:
	_from = value


func _get_from():
	return _from


func _set_to(value) -> void:
	_to = value


func _get_to():
	return _to


func _set_is_from(value: bool) -> void:
	_is_from = value


func _get_is_from() -> bool:
	return _is_from


func _set_as_relative(value: bool) -> void:
	_as_relative = value


func _get_as_relative() -> bool:
	return _as_relative
