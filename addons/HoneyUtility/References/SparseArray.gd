class_name SparseArray
extends ArrayCore

var _default_value
 
 
func _init(default_value) -> void:
	_elements = {}
	_default_value = default_value
 
 
func set_value(index: int,value) -> void:
	_elements[index] = value
 
 
func get_value(index: int):
	return _elements.get(index, _default_value)
 
 
func remove_value(index: int) -> void:
	_elements.erase(index)

 
func copy() -> Dictionary:
	var new_array := {}
	for key in keys():
		new_array[key] = _elements[key]
	return new_array


func filter(func_ref: FuncRef) -> Dictionary:
	var filtered_array := {}
	for key in keys():
		if func_ref.call_funcv([_elements[key]]) == true:
			filtered_array[key] = _elements[key]
	return filtered_array
 
 
func clone() -> Dictionary:
	return copy()
 
 
func serialize() -> Dictionary:
	return {"elements": _elements,"default_value": _default_value}
 
 
func deserialize(data: Dictionary) -> void:
	_elements = data["elements"]
	_default_value = data["default_value"]
