tool
class_name CountTimer
extends TimerCore

signal time_count_started()
signal time_count_changed(count)
signal time_count_finished()

enum CountModes{INCREMENT, DECREMENT}

var count := 0 setget set_count,get_count
var counter := 0 setget set_counter,get_counter
var count_mode : int = CountModes.INCREMENT setget set_count_mode,get_count_mode


func _setup_timers() -> void:
	_setup_properties()
	_connect_signals()


func _setup_properties() -> void:
	set_one_shot(true)
	set_repeat_count(count)


func set_count(value: int) -> void:
	count = value


func get_count() -> int:
	return count


func set_counter(value: int) -> void:
	counter = value


func get_counter() -> int:
	return counter


func set_count_mode(value: int) -> void:
	count_mode = value


func get_count_mode() -> int:
	return count_mode


func _connect_signals() -> void:
	connect("time_started", self, "_on_time_started")
	connect("time_repeat_counted", self, "_on_time_repeat_counted")
	connect("time_repeat_finished", self, "emit_signal", ["time_count_finished"])


func _on_time_started() -> void:
	if count_mode == CountModes.INCREMENT:
		counter = 0
	elif count_mode == CountModes.DECREMENT:
		counter = count
	emit_signal("time_count_changed", counter)


func _on_time_repeat_counted() -> void:
	if count_mode == CountModes.INCREMENT:
		counter += 1
	elif count_mode == CountModes.DECREMENT:
		counter -= 1
	emit_signal("time_count_changed", counter)


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"CountTimer","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"auto_start","type":TYPE_BOOL})
	properties.append({"name":"count","type":TYPE_INT})
	properties.append({"name":"count_mode","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Increment,Decrement"})
	properties.append({"name":"Time Execution","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"process_mode","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Idle,Physics"})
	properties.append({"name":"wait_time","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.001,4096"})
	properties.append({"name":"Time Limits","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"max_time","type":TYPE_REAL})
	properties.append({"name":"min_time","type":TYPE_REAL})
	properties.append({"name":"Time Scale","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"time_scale","type":TYPE_REAL})
	properties.append({"name":"speed_factor","type":TYPE_REAL})
	return properties
