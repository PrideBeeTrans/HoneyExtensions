class_name BitArray
extends Reference

var _bits := PoolByteArray() setget _set_bits,_get_bits
var _size := 0 setget _set_size,_get_size


func _init(size: int) -> void:
	_size = size
	var byte_size := (size + 7) / 8
	_bits = PoolByteArray()
	_bits.resize(byte_size)
	

func set_bit(index: int,value: bool) -> void:
	var byte_index := index / 8
	var bit_index := index % 8 
	
	var mask := 1 << bit_index
	if value == true:
		_bits[byte_index] |= mask
	else:
		_bits[byte_index] &= ~mask


func get_bit(index: int) -> bool:
	var byte_index := index / 8
	var bit_index := index % 8
	
	var mask := 1 << bit_index
	return bool(_bits[byte_index] & mask)


func _set_bits(value: PoolByteArray) -> void:
	_bits = value


func _get_bits() -> PoolByteArray:
	return _bits


func _set_size(value: int) -> void:
	_size = value


func _get_size() -> int:
	return _size
