class_name SparseArray
extends Reference

var _values := {}
var _default_value


func _init(default_value) -> void:
	_values = {}
	_default_value = default_value


func pick_random():
	randomize()
	var rand_index := rand_range(0, size())
	var item = _values[rand_index]
	return item


func pick_random_amount(amount: int) -> Array:
	randomize()
	var rand_index := rand_range(0, size())
	var items := []
	
	for i in amount:
		var item = pick_random()
		if items.has(item):
			item = pick_random()
		items.append(item)
	return items


func set_value(index: int,value) -> void:
	_values[index] = value


func get_value(index: int):
	return _values.get(index, _default_value)


func remove_value(index: int) -> void:
	_values.erase(index)


func clear() -> void:
	_values.clear()


func values() -> Array:
	return _values.values()


func keys() -> Array:
	return _values.keys()


func size() -> int:
	return _values.size()


func is_empty() -> bool:
	return _values.empty()


func insert_range(start_index: int,values: Array) -> void:
	for i in range(values.size()):
		_values[start_index + i] = values[i]


func remove_range(start_index: int,end_index: int) -> void:
	for i in range(start_index, end_index + 1):
		_values.erase(i)


func sort() -> void:
	var sorted_keys = _values.keys().sort()
	var sorted_values := []
	
	for key in sorted_keys:
		sorted_values.append(_values[key])
	_values.clear()
	
	for i in range(sorted_keys.size()):
		_values[i] = sorted_values[i]


func copy() -> SparseArray:
	var new_array := SparseArray.new(_default_value)
	new_array._values = _values.duplicate()
	return new_array


func clone() -> SparseArray:
	return copy()


func serialize() -> Dictionary:
	return {"values": _values,"default_value": _default_value}


func deserialize(data: Dictionary) -> void:
	_values = data["values"]
	_default_value = data["default_value"]


func find(value) -> int:
	for key in _values.keys():
		if _values[key] == value:
			return key
	return -1


func filter(object: Object,method: String) -> SparseArray:
	var filtered_array := SparseArray.new(_default_value)
	for key in _values.keys():
		if object.call(method, _values[key]):
			filtered_array.set_value(key, _values[key])
	return filtered_array
