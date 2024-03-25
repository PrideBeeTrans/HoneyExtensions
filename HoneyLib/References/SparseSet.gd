class_name SparseSet
extends Reference

var _indices := {}


func _init() -> void:
	_indices = {}


func insert(index: int) -> void:
	_indices[index] = true


func remove(index: int) -> void:
	_indices.erase(index)
	
	
func clear() -> void:
	_indices.clear()
	

func size() -> int:
	return _indices.size()


func is_empty() -> bool:
	return _indices.empty()


func get_random_index() -> int:
	return _indices.keys().pick_random()


func get_all_indices() -> Array:
	return _indices.keys()
