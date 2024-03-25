tool
class_name SpawnerBase2D
extends Component2D

var local_position := false


func spawn_random(
	array: Array,
	instance_position: Vector2 = get_global_position()
	) -> Node:
	var scene := array.pick_random() as PackedScene 
	if scene == null:
		return null
	var instance := spawn(scene, instance_position)
	randomize()
	return instance
	

func spawn(
	scene: PackedScene,
	instance_position: Vector2 = get_global_position()
	) -> Node:
	if scene == null:
		return null
	var instance := scene.instance()
	if is_local_position() == false:
		instance.set_global_position(instance_position)
	elif is_local_position() == true:
		instance.set_position(instance_position)
	return instance


func set_local_position(value: bool) -> void:
	local_position = value 


func is_local_position() -> bool:
	return local_position


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"SpawnerBase2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"local_position","type":TYPE_BOOL})
	return properties
