tool
class_name Spawner2D
extends SpawnerCore2D

enum SpawnType {SIMPLE, GROUP}
enum ScenesType {ID, RANDOM}

var spawn_type : int = SpawnType.SIMPLE setget set_spawn_type,get_spawn_type
var scene : PackedScene = null setget set_scene,get_scene

var scenes_type : int = ScenesType.ID setget set_scenes_type,get_scenes_type
var scene_id := "" setget set_scene_id,get_scene_id
var scenes := {} setget set_scenes,get_scenes


func get_scene_default() -> PackedScene:
	if is_spawn_type_simple() == true:
		return get_scene()
	else:
		if is_type_id() == true:
			return scenes[scene_id]
		elif is_type_random() == true:
			randomize()
			var rand_index := rand_range(0, scenes.size())
			var key_name := scenes.keys()[rand_index] as String
			return scenes[key_name]
	return null


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


func set_scenes_type(value: int) -> void:
	scenes_type = value
	property_list_changed_notify()


func get_scenes_type() -> int:
	return scenes_type


func is_type_id() -> bool:
	return get_scenes_type() == ScenesType.ID


func is_type_random() -> bool:
	return get_scenes_type() == ScenesType.RANDOM


func set_scene_id(value: String) -> void:
	scene_id = value


func get_scene_id() -> String:
	return scene_id


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
		properties.append({"name":"Scenes","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
		properties.append({"name":"scenes_type","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Id,Random"})
		if is_type_id() == true:
			properties.append({"name":"scene_id","type":TYPE_STRING})
		properties.append({"name":"scenes","type":TYPE_DICTIONARY})
	return properties
