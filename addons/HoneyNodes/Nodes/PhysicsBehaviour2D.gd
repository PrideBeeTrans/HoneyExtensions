tool
class_name PhysicsBehaviour2D
extends Node2D

const EMPTY_VALUE := 0.0
const STOP_THRESHOLD := 0.0
const JUMPING_THRESHOLD := 0.0
const FALLING_THRESHOLD := 0.0

enum BehaviourModes{CHARACTER, PROJECTILE, NONE}

var target_path : NodePath = ".." setget set_target_path,get_target_path
var behaviour_mode : int = BehaviourModes.CHARACTER setget set_behaviour_mode,get_behaviour_mode
var auto_start := false setget set_auto_start,is_auto_start
var direction := Vector2.ZERO setget set_direction,get_direction

var move_data : Resource = null setget set_move_data,get_move_data
var gravity_data : Resource = null setget set_gravity_data,get_gravity_data
var max_velocity := Vector2.ZERO setget set_max_velocity,get_max_velocity

onready var target := get_node_or_null(target_path) as Node2D setget set_target,get_target

var velocity := Vector2.ZERO setget set_velocity,get_velocity


func reset_velocity() -> void:
	reset_velocity_x()
	reset_velocity_y()


func reset_velocity_x() -> void:
	set_velocity_x(EMPTY_VALUE)


func reset_velocity_y() -> void:
	set_velocity_y(EMPTY_VALUE)


func apply_dash(dash_impulse: Vector2) -> void:
	apply_impulse(dash_impulse)


func apply_jump(jump_strength: float = _get_jump_strength()) -> void:
	velocity.y = jump_strength


func interrupt_jump(release_strength: float = _get_release_strength()) -> void:
	velocity.y *= release_strength


func apply_impulse(impulse: Vector2) -> void:
	if impulse.x != 0:
		set_velocity_x(impulse.x)
	if impulse.y != 0:
		set_velocity_y(impulse.y)


func acceleration_on_grounded(move_direction: Vector2) -> void:
	var move_speed := _get_move_speed()
	var move_to := move_direction.x * move_speed
	var weight := _get_move_weight(move_direction) if target.is_on_floor() else _get_air_weight(move_direction)
	set_velocity_x(lerp(get_velocity_x(), move_to, weight))


func acceleration_on_floating(move_direction: Vector2) -> void:
	var move_speed := _get_move_speed()
	var move_to := move_direction * move_speed
	var weight := _get_move_weight(move_direction)
	set_velocity(lerp(get_velocity(), move_to, weight))


func apply_gravity(delta: float) -> void:
	var gravity := _get_gravity()
	velocity.y += gravity * delta
	clamp_velocity()


func apply_movement(
	up_direction: Vector2 = Vector2.ZERO,
	stop_on_slope: bool = false,
	max_slides: int = 4,
	floor_max_angle: float = 0.785398,
	infinite_inertia: bool = true) -> void:
	if target == null:
		return
	if target.get_class() == "EntityBody2D":
		target.set_velocity(get_velocity())
		target.collide_and_slide()
		set_velocity(target.get_velocity())
	elif target.get_class() == "KinematicBody2D":
		set_velocity(target.move_and_slide(get_velocity(), up_direction, stop_on_slope, max_slides, floor_max_angle, infinite_inertia))
	clamp_velocity()


func clamp_velocity() -> void:
	if get_max_velocity_x() != EMPTY_VALUE:
		set_velocity_x(clamp(get_velocity_x(), -get_max_velocity_x(), get_max_velocity_x()))
	if get_max_velocity_y() != EMPTY_VALUE:
		set_velocity_y(clamp(get_velocity_y(), -get_max_velocity_y(), get_max_velocity_y()))


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


func is_moving_grounded() -> bool:
	return get_velocity().x != STOP_THRESHOLD


func is_moving() -> bool:
	return get_velocity().length() != STOP_THRESHOLD


func is_jumping() -> bool:
	return get_velocity_y() < JUMPING_THRESHOLD


func is_falling() -> bool:
	return get_velocity_y() > FALLING_THRESHOLD


func set_target_path(value: NodePath) -> void:
	target_path = value


func get_target_path() -> NodePath:
	return target_path


func set_target(value: Node2D) -> void:
	target = value


func get_target() -> Node2D:
	return target


func set_direction(value: Vector2) -> void:
	direction = value
	

func get_direction() -> Vector2:
	return direction


func set_behaviour_mode(value: int) -> void:
	behaviour_mode = value
	property_list_changed_notify()


func get_behaviour_mode() -> int:
	return behaviour_mode


func is_mode_character() -> bool:
	return get_behaviour_mode() == BehaviourModes.CHARACTER


func is_mode_projectile() -> bool:
	return get_behaviour_mode() == BehaviourModes.PROJECTILE


func is_mode_none() -> bool:
	return get_behaviour_mode() == BehaviourModes.NONE


func set_auto_start(value: bool) -> void:
	auto_start = value
	property_list_changed_notify()


func is_auto_start() -> bool:
	return auto_start


func set_move_data(value: Resource) -> void:
	move_data = value


func get_move_data() -> Resource:
	return move_data


func _get_move_speed() -> float:
	return get_move_data().get_move_speed() if get_move_data() != null else EMPTY_VALUE


func _get_move_weight(move_direction: Vector2) -> float:
	return get_move_data().get_move_weight(move_direction) if get_move_data() != null else EMPTY_VALUE


func _get_air_weight(move_direction: Vector2) -> float:
	return get_move_data().get_air_weight(move_direction) if get_move_data() != null else EMPTY_VALUE


func set_gravity_data(value: Resource) -> void:
	gravity_data = value


func get_gravity_data() -> Resource:
	return gravity_data


func _get_gravity() -> float:
	return get_gravity_data().get_gravity(is_falling()) if get_gravity_data() != null else EMPTY_VALUE


func _get_jump_strength() -> float:
	return get_gravity_data().get_jump_strength() if get_gravity_data() != null else EMPTY_VALUE


func _get_release_strength() -> float:
	return get_gravity_data().get_release_strength() if get_gravity_data() != null else EMPTY_VALUE


func set_max_velocity(value: Vector2) -> void:
	max_velocity = value


func get_max_velocity() -> Vector2:
	return max_velocity


func set_max_velocity_x(value: float) -> void:
	max_velocity.x = value


func get_max_velocity_x() -> float:
	return max_velocity.x


func set_max_velocity_y(value: float) -> void:
	max_velocity.y = value


func get_max_velocity_y() -> float:
	return max_velocity.y


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"PhysicsBehaviour2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"target_path","type":TYPE_NODE_PATH})
	properties.append({"name":"behaviour_mode","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Character,Projectile,None"})
	if is_mode_projectile() == true or is_mode_none() == true:
		properties.append({"name":"auto_start","type":TYPE_BOOL})
	if is_auto_start() == true:
		properties.append({"name":"direction","type":TYPE_VECTOR2})
	properties.append({"name":"Physics","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"move_data","type":TYPE_OBJECT})
	properties.append({"name":"gravity_data","type":TYPE_OBJECT})
	properties.append({"name":"max_velocity","type":TYPE_VECTOR2})
	return properties
