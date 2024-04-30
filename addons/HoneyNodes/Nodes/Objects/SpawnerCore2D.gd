tool
class_name SpawnerCore2D
extends NodeCore2D

enum PositionType{LOCAL, GLOBAL}

var type_position : int = PositionType.LOCAL setget set_type_position,get_type_position


func spawn(scene: PackedScene = get_scene_default(),instance_position: Vector2 = get_global_position(),parent: Node = self) -> Node:
	if scene == null:
		push_error("Error: The scene is null to instantiate")
		return null
	
	var instance := scene.instance()
	
	if is_type_position() == true:
		instance.set_position(instance)
	
	elif is_type_global() == true:
		instance.set_global_position(instance)
	
	parent.add_child(instance)
	return instance


func get_scene_default() -> PackedScene:
	return null


func set_type_position(value: int) -> void:
	type_position = value


func get_type_position() -> int:
	return type_position


func is_type_position() -> bool:
	return get_type_position() == PositionType.LOCAL


func is_type_global() -> bool:
	return get_type_position() == PositionType.GLOBAL


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"SpawnerCore2D","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"type_position","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Local,Global"})
	return properties
