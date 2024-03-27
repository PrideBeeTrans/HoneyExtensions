tool
class_name Spawner2D
extends SpawnerCore2D

enum SpawnType {SIMPLE, GROUP}

var spawn_type : int = SpawnType.SIMPLE setget set_spawn_type,get_spawn_type
var scene : PackedScene = null setget set_scene,get_scene
var scenes := {} setget set_scenes,get_scenes


func set_spawn_type(value: int) -> void:
	spawn_type = value
	property_list_changed_notify()


func get_spawn_type() -> int:
	return spawn_type
	

func is_spawn_type_simple() -> bool:
	return get_spawn_type() == SpawnType.SIMPLE


func is_spawn_type_group() -> bool:
	return get_spawn_type() == SpawnType.GROUP


func set_scene(value: PackedScene) -> void:
	scene = value


func get_scene() -> PackedScene:
	return scene


func set_scenes(value: Dictionary) -> void:
	scenes = value


func get_scenes() -> Dictionary:
	return scenes


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"Spawner2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"spawn_type","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Simple,Group"})
	if is_spawn_type_simple() == true:
		properties.append({"name":"scene","type":TYPE_OBJECT,"hint":PROPERTY_HINT_RESOURCE_TYPE,"hint_string":"PackedScene"})
	elif is_spawn_type_group() == true:
		properties.append({"name":"scenes","type":TYPE_DICTIONARY})
	return properties
