tool
class_name GravityData
extends Data

const JUMP_DIRECTION := -1.0

var jump_height := 65.0 setget set_jump_height,get_jump_height
var jump_duration := 0.4 setget set_jump_duration,get_jump_duration
var gravity_mult := 2.0 setget set_gravity_mult,get_gravity_mult
var fall_mult := 2.0 setget set_fall_mult,get_fall_mult
var release_strength := 0.4 setget set_release_strength,get_release_strength


func get_normal_gravity() -> float:
	return (get_jump_height() * get_gravity_mult()) / pow(get_gravity_mult(), get_jump_duration())


func get_fall_gravity() -> float:
	return get_normal_gravity() * get_fall_mult()


func get_gravity(is_falling: bool) -> float:
	return get_fall_gravity() if is_falling == true else get_normal_gravity()


func get_jump_strength() -> float:
	return (get_normal_gravity() * get_jump_duration()) * JUMP_DIRECTION


func set_jump_height(value: float) -> void:
	jump_height = value


func get_jump_height() -> float:
	return jump_height


func set_jump_duration(value: float) -> void:
	jump_duration = value


func get_jump_duration() -> float:
	return jump_duration


func set_gravity_mult(value: float) -> void:
	gravity_mult = value


func get_gravity_mult() -> float:
	return gravity_mult


func set_fall_mult(value: float) -> void:
	fall_mult = value


func get_fall_mult() -> float:
	return fall_mult
	

func set_release_strength(value: float) -> void:
	release_strength = value


func get_release_strength() -> float:
	return release_strength


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"GravityData","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"jump_height","type":TYPE_REAL})
	properties.append({"name":"jump_duration","type":TYPE_REAL})
	properties.append({"name":"gravity_mult","type":TYPE_REAL})
	properties.append({"name":"fall_mult","type":TYPE_REAL})
	properties.append({"name":"release_strength","type":TYPE_REAL})
	return properties
