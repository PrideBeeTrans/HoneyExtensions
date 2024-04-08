class_name HoneyEaser
extends HoneyParameters

signal easing_started()
signal easing_completed()


func set_speed_scale(value: float) -> HoneyEaser:
	_set_speed_scale(value)
	return self
	

func set_delay(value: float) -> HoneyEaser:
	_set_delay(value)
	return self


func set_loops(value: int,loop_type: String = LoopTypes.Restart) -> HoneyEaser:
	_set_loop_count(value)
	_set_loop_type(loop_type)
	return self


func play_in(value: float) -> HoneyEaser:
	_set_delay(value)
	return self


#func play() -> HoneyEaser:
	#_set_started(true)
	#return self


func reset() -> HoneyEaser:
	_set_started(false)
	_set_reverse(false)
	_set_completed(false)
	_set_elapsed_time(EMPTY_TIME)
	_check_loop_type()
	return self


func _process_easing(delta: float,from_sequence: bool = false) -> void:
	if _in_sequence() == from_sequence:
		_check_started()
		_check_completed()
		
		if _has_delay() == true:
			_set_delay(_get_delay() - delta * _get_speed_scale())
			return
		
		if _is_completed() == true:
			return
		
		_clamp_elapsed_time(delta)
		_easing_step()


func _easing_step() -> void:
	pass


func _check_loop_type() -> void:
	pass


func _clamp_elapsed_time(delta: float) -> void:
	if _is_easing_in_progress() == true:
		_set_elapsed_time(_get_elapsed_time() + delta * _get_speed_scale())


func _check_started() -> void:
	if not _is_started() == true:
		_set_started(true)
		emit_signal("easing_started")


func _check_loop() -> void:
	if _has_loops() == true:
		_set_loop_count(_get_loop_count() -1)
		reset()
	elif _is_loop_infinity() == true:
		reset()


func _check_completed() -> void:
	if _is_easing_completed() == true:
		_set_completed(true)
		_check_loop()
		emit_signal("easing_completed")
