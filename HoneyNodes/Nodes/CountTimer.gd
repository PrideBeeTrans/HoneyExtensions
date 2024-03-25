tool
class_name CountTimer
extends Timer

const MIN_VALUE := 1
const EMPTY_VALUE := 0

signal count_started()
signal count_changed(new_value)
signal count_finished()

enum CountModes{INCREASE, DECREMENT}

var count_mode : int = CountModes.INCREASE setget set_count_mode,get_count_mode
var target_value := 0 setget set_target_value,get_target_value

var count := 0 setget set_count,get_count


func _ready() -> void:
	if Engine.is_editor_hint() == true:
		return
	_connect_signals()


func _connect_signals() -> void:
	_connect_timer()


func _connect_timer() -> void:
	connect("timeout", self, "_on_timeout")


func start_count() -> void:
	if is_mode_decrement() == true:
		set_count(get_target_value())
	start()
	emit_signal("count_started")


func _on_timeout() -> void:
	if is_mode_increase() == true:
		set_count(get_count() + MIN_VALUE)
		
		if count == target_value:
			emit_signal("count_finished")
			stop()
	
	elif is_mode_decrement() == true:
		set_count(get_count() - MIN_VALUE)
		
		if count == EMPTY_VALUE:
			emit_signal("count_finished")
			stop()


func set_count_mode(value: int) -> void:
	count_mode = value
	property_list_changed_notify()


func get_count_mode() -> int:
	return count_mode


func set_count(value: int) -> void:
	count = value
	emit_signal("count_changed", count)


func get_count() -> int:
	return count


func set_target_value(value: int) -> void:
	target_value = value


func get_target_value() -> int:
	return target_value


func is_mode_increase() -> bool:
	return get_count_mode() == CountModes.INCREASE


func is_mode_decrement() -> bool:
	return get_count_mode() == CountModes.DECREMENT


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"CountTimer","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"count_mode","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Increase,Decrement"})
	properties.append({"name":"target_value","type":TYPE_INT})
	return properties
