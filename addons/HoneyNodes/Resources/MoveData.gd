tool
class_name MoveData
extends Resource

enum TypeWeight{GROUNDED, FLOATING}

var move_speed := 55 * 8 setget set_move_speed,get_move_speed
var type_weight : int = TypeWeight.GROUNDED setget set_type_weight,get_type_weight

var acceleration := 0.4 setget set_acceleration,get_acceleration
var friction := 0.3 setget set_friction,get_friction
var air_control := 0.1 setget set_air_control,get_air_control
var air_brake := 0.02 setget set_air_brake,get_air_brake


func get_floor_weight(move_direction) -> float:
	return get_acceleration() if move_direction.length() != 0 else get_friction()


func get_air_weight(move_direction) -> float:
	return get_air_control() if move_direction.length() != 0 else get_air_brake()


func set_move_speed(value: int) -> void:
	move_speed = value


func get_move_speed() -> int:
	return move_speed


func set_type_weight(value: int) -> void:
	type_weight = value
	property_list_changed_notify()


func get_type_weight() -> int:
	return type_weight
	

func is_type_grounded() -> bool:
	return get_type_weight() == TypeWeight.GROUNDED


func is_type_floating() -> bool:
	return get_type_weight() == TypeWeight.FLOATING


func set_acceleration(value: float) -> void:
	acceleration = value


func get_acceleration() -> float:
	return acceleration


func set_friction(value: float) -> void:
	friction = value


func get_friction() -> float:
	return friction
	
	
func set_air_control(value: float) -> void:
	air_control = value


func get_air_control() -> float:
	return air_control


func set_air_brake(value: float) -> void:
	air_brake = value


func get_air_brake() -> float:
	return air_brake


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"MoveData","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"move_speed","type":TYPE_INT})
	properties.append({"name":"type_weight","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Grounded,Floating"})
	properties.append({"name":"Weight","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"acceleration","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
	properties.append({"name":"friction","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
	if is_type_grounded() == true:
		properties.append({"name":"air_control","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
		properties.append({"name":"air_brake","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.0,1.0"})
	return properties
