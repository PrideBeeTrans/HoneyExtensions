class_name ArrayCore
extends Reference

var _elements := {}


func _init() -> void:
	_elements = {}


func append(element) -> void:
	var index := _elements.size()
	_elements[index] = element


func append_array(array: Array) -> void:
	for i in array:
		append(i)


func has(element) -> bool: 
	var index_element := index_of(element)
	return _elements.has(index_element)


func contains(element) -> bool:
	return index_of(element) != -1


func index_of(element) -> int:
	var index := 0
	for value in values():
		if value == element:
			return index
		index += 1
	return -1


func get_element(index: int):
	return _elements.get(index, null)


func get_elements()  -> Array:
	var elements := []
	for key in keys():
		elements.append(_elements[key])
	return elements 


func remove(index: int) -> void:
	if _elements.has(index):
		_elements.erase(index)


func clear() -> void:
	_elements.clear()


func size() -> int:
	return _elements.size()


func is_empty() -> bool:
	return _elements.empty()


func keys() -> Array:
	return _elements.keys()


func values() -> Array:
	return _elements.values()


func pick_random():
	randomize()
	var rand_index := rand_range(0, size())
	var list_elements := values()
	var value = list_elements[rand_index]
	return value


func remove_random() -> void:
	randomize()
	var rand_index := rand_range(0, size())
	var list_elements := values()
	remove(rand_index)


func remove_random_amount(amount: int) -> void:
	var rand_index := rand_range(0, size())
	var list_items := values()
	for index in range(amount):
		randomize()
		list_items.erase(rand_index)


func pick_random_amount(amount: int) -> Array:
	var items := []
	var rand_index := rand_range(0, size())
	var list_items := values()
	for index in range(amount):
		randomize()
		var item = pick_random()
		if items.has(item):
			item = pick_random()
		items.append(item)
	return items


func print_array() -> void:
	print_debug("Array Data:" + str(get_elements()))
	for element in get_elements():
		print_debug("key:%s" % element)


func shuffle() -> void:
	var elements_keys := keys()
	var shuffled_keys := elements_keys.duplicate()
	shuffled_keys.shuffle()
	var shuffled_array = {}
	for key in shuffled_keys:
		randomize()
		shuffled_array[key] = _elements[key]
	_elements = shuffled_array


func insert_range(start_index: int,values: Array) -> void:
	for i in range(values.size()):
		_elements[start_index + i] = _elements[i]


func find(value) -> int:
	for key in _elements.keys():
		if _elements[key] == value:
			return key
	return -1

 
func remove_range(start_index: int,end_index: int) -> void:
	for i in range(start_index, end_index + 1):
		_elements.erase(i)
 
 
func sort() -> void:
	var sorted_keys = _elements.keys().sort()
	var sorted_values := []
	for key in sorted_keys:
		sorted_values.append(_elements[key])
	_elements.clear()
	for i in range(sorted_keys.size()):
		_elements[i] = sorted_values[i]
