tool
class_name PhysicsBehaviour2D
extends NodeCore2D

const EMPTY_VALUE := 0
const EMPTY_VELOCITY := Vector2.ZERO

var target_path := NodePath() setget set_target_path,get_target_path

onready var target := get_node_or_null(target_path) as Node2D setget set_target,get_target

var move_data : Resource = null setget set_move_data,get_move_data
var gravity_data : Resource = null setget set_gravity_data,get_gravity_data

var velocity := Vector2.ZERO setget set_velocity,get_velocity


func apply_dash(impulse: Vector2) -> void:
	apply_impulse(impulse)


func apply_dash_x(impulse: Vector2) -> void:
	apply_impulse_x(impulse.x)


func apply_dash_y(impulse: Vector2) -> void:
	apply_impulse_y(impulse.y)


func apply_jump() -> void:
	if get_gravity_data() == null:
		return
	
	var jump_strength := get_gravity_data().get_jump_strength() as float
	set_velocity_y(get_velocity_y() - jump_strength)


func interrupt_jump() -> void:
	if is_jumping() == true:
		var release_strength := get_gravity_data().get_jump_strength() as float
		set_velocity_y(get_velocity_y() * release_strength)


func apply_impulse(impulse: Vector2) -> void:
	apply_impulse_x(impulse.x)
	apply_impulse_y(impulse.y)


func apply_impulse_x(impulse: float) -> void:
	if impulse == 0:
		return
	
	set_velocity_x(impulse)


func apply_impulse_y(impulse: float) -> void:
	if impulse == 0:
		return

	set_velocity_y(impulse)


func reset_velocity() -> void:
	reset_velocity_x()
	reset_velocity_y()


func reset_velocity_x() -> void:
	set_velocity_x(EMPTY_VALUE)


func reset_velocity_y() -> void:
	set_velocity_y(EMPTY_VALUE)


func acceleration_grounded(move_direction: Vector2,is_on_floor: bool) -> void:
	if get_move_data() == null:
		return
	
	var move_speed := get_move_data().get_move_speed() as float
	var move_to := move_speed * move_direction.x
	var weight_floor :=  get_move_data().get_floor_weight() as float
	var weight_air :=  get_move_data().get_air_weight() as float
	var weight := weight_floor if is_on_floor else weight_air
	set_velocity_x(lerp(get_velocity_x(), move_to, weight))


func acceleration_floating(move_direction: Vector2) -> void:
	if get_move_data() == null:
		return
	
	var move_speed := get_move_data().get_move_speed() as float
	var move_to := move_speed * move_direction.normalized()
	var weight_floor :=  get_move_data().get_floor_weight() as float
	set_velocity(lerp(get_velocity(), move_to, weight_floor))


func apply_gravity(delta: float) -> void:
	if get_gravity_data() == null:
		return
	
	var gravity := get_gravity_data().get_gravity(is_falling()) as float
	set_velocity_y(gravity + delta)


func apply_movement() -> void:
	if target.get_class() == "Node2D":
		pass


func set_target_path(value: NodePath) -> void:
	target_path = value


func get_target_path() -> NodePath:
	return target_path


func set_target(value: Node2D) -> void:
	target = value


func get_target() -> Node2D:
	return target


func set_velocity(value: Vector2) -> void:
	velocity = value


func set_velocity_x(value: float) -> void:
	velocity.x = value


func set_velocity_y(value: float) -> void:
	velocity.y = value


func get_velocity() -> Vector2:
	return velocity


func get_velocity_x() -> float:
	return velocity.x


func get_velocity_y() -> float:
	return velocity.y


func _is_moving() -> bool:
	return get_velocity().length() != EMPTY_VALUE


func _is_moving_floor() -> bool:
	return  get_velocity_x() != EMPTY_VALUE


func is_jumping() -> bool:
	return get_velocity_y() < EMPTY_VALUE


func is_falling() -> bool:
	return get_velocity_y() > EMPTY_VALUE


func set_move_data(value: Resource) -> void:
	move_data = value


func get_move_data() -> Resource:
	return move_data


func set_gravity_data(value: Resource) -> void:
	gravity_data = value


func get_gravity_data() -> Resource:
	return gravity_data


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"PhysicsBehaviour2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"target_path","type":TYPE_NODE_PATH})
	properties.append({"name":"Physics","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"move_data","type":TYPE_OBJECT})
	properties.append({"name":"gravity_data","type":TYPE_OBJECT})
	return properties
