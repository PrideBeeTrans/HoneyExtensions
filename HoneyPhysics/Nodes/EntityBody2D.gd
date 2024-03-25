tool
class_name EntityBody2D
extends KinematicBody2D

enum MotionModes{GROUNDED, FLOATING}

var motion_mode : int = MotionModes.GROUNDED setget set_motion_mode,get_motion_mode
var up_direction := Vector2.UP setget set_up_direction,get_up_direction
var slide_on_ceiling := true setget set_slide_on_ceiling,get_slide_on_ceiling
var wall_min_slide_angle := 15.0 setget set_wall_min_slide_angle,get_wall_min_slide_angle

var floor_max_slides := 4 setget set_max_slides,get_max_slides
var floor_stop_on_slope := true setget set_stop_on_slope,get_stop_on_slope
var floor_constant_speed := false setget set_constant_speed,get_constant_speed
var floor_block_on_wall := true setget set_block_on_wall,get_block_on_wall
var floor_max_angle := 45.0 setget set_max_angle,get_max_angle
var floor_snap_length := 1.0 setget set_snap_length,get_snap_length

var velocity := Vector2.ZERO setget set_velocity,get_velocity
var _snap := false setget _set_snap,_get_snap


func apply_snap() -> void:
	pass


func apply_impulse(impulse: Vector2) -> void:
	if impulse.x != 0:
		set_velocity_x(impulse.x)
	if impulse.y != 0:
		set_velocity_y(impulse.y)


func collide_and_slide() -> void:
	velocity = move_and_slide(velocity, up_direction, floor_stop_on_slope, floor_max_slides, floor_max_angle)


func set_up_direction(value: Vector2) -> void:
	up_direction = value


func get_up_direction() -> Vector2:
	return up_direction


func set_motion_mode(value: int) -> void:
	motion_mode = value
	property_list_changed_notify()


func get_motion_mode() -> int:
	return motion_mode


func is_mode_grounded() -> bool:
	return get_motion_mode() == MotionModes.GROUNDED


func is_mode_floating() -> bool:
	return get_motion_mode() == MotionModes.FLOATING


func set_slide_on_ceiling(value: bool) -> void:
	slide_on_ceiling = value


func get_slide_on_ceiling() -> bool:
	return slide_on_ceiling


func set_wall_min_slide_angle(value: float) -> void:
	wall_min_slide_angle = value


func get_wall_min_slide_angle() -> float:
	return wall_min_slide_angle


func set_max_slides(value: int) -> void:
	floor_max_slides = value


func get_max_slides() -> int:
	return floor_max_slides


func set_stop_on_slope(value: bool) -> void:
	floor_stop_on_slope = value


func get_stop_on_slope() -> bool:
	return floor_stop_on_slope


func set_constant_speed(value: bool) -> void:
	floor_constant_speed = value


func get_constant_speed() -> bool:
	return floor_constant_speed


func set_block_on_wall(value: bool) -> void:
	floor_block_on_wall = value


func get_block_on_wall() -> bool:
	return floor_block_on_wall


func set_max_angle(value: float) -> void:
	floor_max_angle = value


func get_max_angle() -> float:
	return floor_max_angle


func set_snap_length(value: float) -> void:
	floor_snap_length = value


func get_snap_length() -> float:
	return floor_snap_length


func set_velocity(value: Vector2) -> void:
	velocity = value


func get_velocity() -> Vector2:
	return velocity


func set_velocity_x(value: float) -> void:
	velocity.x = value


func get_velocity_x() -> float:
	return get_velocity().x


func set_velocity_y(value: float) -> void:
	velocity.y = value


func get_velocity_y() -> float:
	return get_velocity().y


func _set_snap(value: bool) -> void:
	_snap = value


func _get_snap() -> bool:
	return _snap


func get_class() -> String:
	return "EntityBody2D"


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"EntityBody2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"motion_mode","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Grounded,Floating"})
	if is_mode_floating() == true:
		properties.append({"name":"wall_min_slide_angle","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,180"})
	if is_mode_grounded() == true:
		properties.append({"name":"up_direction","type":TYPE_VECTOR2})
		properties.append({"name":"slide_on_ceiling","type":TYPE_BOOL})
		properties.append({"name":"Floor","type":TYPE_NIL,"hint_string":"floor_","usage":PROPERTY_USAGE_GROUP | PROPERTY_USAGE_SCRIPT_VARIABLE})
		properties.append({"name":"floor_max_slides","type":TYPE_INT})
		properties.append({"name":"floor_stop_on_slope","type":TYPE_BOOL})
		properties.append({"name":"floor_constant_speed","type":TYPE_BOOL})
		properties.append({"name":"floor_block_on_wall","type":TYPE_BOOL})
		properties.append({"name":"floor_max_angle","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,180"})
		properties.append({"name":"floor_snap_length","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0,32"})
	return properties
