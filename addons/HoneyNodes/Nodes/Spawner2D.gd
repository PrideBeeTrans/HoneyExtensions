tool
class_name Spawner2D
extends SpawnerBase2D

var scenes := {} setget set_scenes,get_scenes


func spawn_by_id(
	scene: PackedScene = get_first_scene(),
	instance_position: Vector2 = get_global_position()
	) -> Node:
	var instance := spawn(scene, instance_position)
	return instance


func spawn(
	scene: PackedScene = get_first_scene(),
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


func get_first_scene() -> PackedScene:
	var start_index := 0
	var scene := scenes.values()[start_index] as PackedScene
	return scene


func set_scenes(value: Dictionary) -> void:
	scenes = value


func get_scenes() -> Dictionary:
	return scenes


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Spawner2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"scenes","type":TYPE_DICTIONARY})
	return properties
