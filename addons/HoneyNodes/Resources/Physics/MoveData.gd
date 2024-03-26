tool
class_name MoveData
extends Data

signal stop_threshold_changed()
signal move_speed_changed()

signal type_weight_changed()
signal acceleration_changed()
signal friction_changed()
signal air_control_changed()
signal air_brake_changed()

enum TypeWeight{GROUNDED, FLOATING}

var stop_threshold := 64 setget set_stop_threshold,get_stop_threshold
var move_speed := 7 * 50 setget set_move_speed,get_move_speed
var type_weight : int = TypeWeight.GROUNDED setget set_type_weight,get_type_weight

var acceleration := 0.4 setget set_acceleration,get_acceleration
var friction := 0.35 setget set_friction,get_friction
var air_control := 0.1 setget set_air_control,get_air_control
var air_brake := 0.02 setget set_air_brake,get_air_brake


func get_move_weight(move_direction: Vector2) -> float:
	return get_acceleration() if move_direction.length() != 0 else get_friction()


func get_air_weight(move_direction: Vector2) -> float:
	return get_air_control() if move_direction.length() != 0 else get_air_brake()


func set_stop_threshold(value: int) -> void:
	stop_threshold = value
	emit_signal("stop_threshold_changed")


func get_stop_threshold() -> int:
	return stop_threshold


func set_move_speed(value: int) -> void:
	move_speed = value
	emit_signal("move_speed_changed")


func get_move_speed() -> int:
	return move_speed


func set_type_weight(value: int) -> void:
	type_weight = value
	emit_signal("type_weight_changed")
	property_list_changed_notify()


func get_type_weight() -> int:
	return type_weight


func is_type_grounded() -> bool:
	return get_type_weight() == TypeWeight.GROUNDED


func is_type_floating() -> bool:
	return get_type_weight() == TypeWeight.FLOATING


func set_acceleration(value: float) -> void:
	acceleration = value
	emit_signal("acceleration_changed")


func get_acceleration() -> float:
	return acceleration


func set_friction(value: float) -> void:
	friction = value
	emit_signal("friction_changed")


func get_friction() -> float:
	return friction


func set_air_control(value: float) -> void:
	air_control = value
	emit_signal("air_control_changed")


func get_air_control() -> float:
	return air_control


func set_air_brake(value: float) -> void:
	air_brake = value
	emit_signal("air_brake_changed")


func get_air_brake() -> float:
	return air_brake


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"MoveData","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"stop_threshold","type":TYPE_REAL})
	properties.append({"name":"move_speed","type":TYPE_INT})
	properties.append({"name":"type_weight","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Grounded,Floating"})
	properties.append({"name":"Weight","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"acceleration","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
	properties.append({"name":"friction","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
	if is_type_grounded() == true:
		properties.append({"name":"air_control","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
		properties.append({"name":"air_brake","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
	return properties
