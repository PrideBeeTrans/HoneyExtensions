class_name HoneyEasingCore
extends Reference

signal easing_started()
signal easing_completed()

const LoopType := HoneyEasingConstants.LoopTypes
const Min_Elapsed_Time := 0.0

var _properties := {}


func _init() -> void:
	_initialize()
	
	
func _initialize() -> void:
	_initialize_properties()
	_connect_signals()


func _initialize_properties() -> void:
	_add_properties("honey_easing", null)
	_add_properties("easing", null)
	_add_properties("elapsed_time", 0.0)
	_add_properties("duration", 0.0)
	_add_properties("delay", 0.0)
	_add_properties("started", false)
	_add_properties("reverse", false)
	_add_properties("completed", false)
	_add_properties("loop_count", 0)
	_add_properties("in_sequence", false)
	_add_properties("loop_type", LoopType.Restart)
	_add_properties("on_started", {"func_ref":null,"args":[]})
	_add_properties("on_loop_completed", {"func_ref":null,"args":[]})
	_add_properties("on_completed", {"func_ref":null,"args":[]})


func _connect_signals() -> void:
	pass


func _process_easing(delta: float,from_sequence: bool = false) -> void:
	if _in_sequence() == from_sequence:
		_check_started()
		_check_completed()
		
		if _has_delay() == true:
			set_delay(_get_delay() - delta)
			return
		
		if _is_completed() == true:
			return
		_clamp_elapsed_time(delta)
		_easing_step()


func _easing_step() -> void:
	pass


func _check_started() -> void:
	if not _is_started() == true:
		_set_started(true)
		emit_signal("easing_started")


func _check_completed() -> void:
	if _get_elapsed_time() == _get_duration() and _is_completed() == false:
		_set_completed(true)
		_check_loop()
		emit_signal("easing_completed")


func _clamp_elapsed_time(delta: float) -> void:
	if _get_elapsed_time() <= _get_duration():
		_set_elapsed_time(_get_elapsed_time() + delta * _get_honey_easing().get_speed_scale())
		

func _set_elapsed_time(value: float) -> void:
	_set_properties("elapsed_time", value)
	_set_properties("elapsed_time", clamp(_get_elapsed_time(), Min_Elapsed_Time, _get_duration()))


func _get_elapsed_time() -> float:
	return _get_properties("elapsed_time")


func set_loops(value: int,loop_type: String = LoopType.Restart) -> HoneyEasingCore:
	_set_loops_count(value)
	_set_loop_type(loop_type)
	return self


func play_in(value: float) -> HoneyEasingCore:
	_set_properties("delay", value)
	return self


func set_delay(value: float) -> HoneyEasingCore:
	_set_properties("delay", value)
	return self


func reset() -> void:
	_set_started(false)
	_set_reverse(false)
	_set_completed(false)
	_set_elapsed_time(0)
	_check_loop_type()


func _check_loop() -> void:
	if _get_loops_count() != 0:
		_set_loops_count(_get_loops_count() - 1)
		reset()
	if _get_loops_count() == -1:
		reset()


func _check_loop_type() -> void:
	pass


func _set_loops_count(value: int) -> void:
	_set_properties("loop_count", value)


func _get_loops_count() -> int:
	return _get_properties("loop_count")


func _set_loop_type(value: String) -> void:
	_set_properties("loop_type", value)


func _get_loop_type() -> String:
	return _get_properties("loop_type")


func _set_duration(value: float) -> void:
	_set_properties("duration", value)


func _get_duration() -> float:
	return _get_properties("duration")


func _set_started(value: bool) -> void:
	_set_properties("started", value)


func _is_started() -> bool:
	return _get_properties("started")
	

func _set_reverse(value: bool) -> void:
	_set_properties("reverse", value)


func _is_reverse() -> bool:
	return _get_properties("reverse")


func _set_completed(value: bool) -> void:
	_set_properties("completed", value)


func _is_completed() -> bool:
	return _get_properties("completed")


func _get_delay() -> float:
	return _get_properties("delay")


func _has_delay() -> bool:
	return _get_delay() > 0


func _set_honey_easing(value: Object) -> void:
	_set_properties("honey_easing", value)


func _get_honey_easing() -> Object:
	return _get_properties("honey_easing")


func _set_in_sequence(value) -> void:
	_set_properties("in_sequence", value)
	
	
func _in_sequence() -> bool:
	return _get_properties("in_sequence")


func _is_sequence() -> void:
	_set_properties("in_sequence", true)


func _add_properties(property_name: String,value) -> void:
	if not _properties.has(property_name):
		_properties[property_name] = value


func _set_properties(property_name: String,value) -> void:
	_properties[property_name] = value


func _get_properties(property_name: String):
	return _properties[property_name]
