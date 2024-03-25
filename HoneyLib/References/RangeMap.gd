class_name RangeMap
extends Reference

var _ranges := []


func add_range(start: float,end: float,value) -> void:
	var range_data := {
		"start": start,
		"end": end,
		"value": value,
	}
	
	_ranges.append(range_data)
	_ranges.sort()


func remove_range(index: int) -> void:
	if index >= 0 and index < _ranges.size():
		_ranges.remove(index)


func clear() -> void:
	_ranges.clear()


func get_value_at_position(position: float):
	for range_data in _ranges:
		if position >= range_data["start"] and position <= range_data["end"]:
			return range_data["value"]
	return null
