class_name HoneyParameters
extends Reference

const LoopTypes := {
	"Restart":"Restart",
}

const EMPTY_TIME := 0.0
const SPEED_SCALE_DEFAULT := 1.0
const EMPTY_LOOP_COUNT := 0
const INFINITY_LOOP_COUNT := -1.0

var _easing
var _elapsed_time := EMPTY_TIME
var _duration := EMPTY_TIME
var _delay := EMPTY_TIME
var _speed_scale := SPEED_SCALE_DEFAULT

var _started := false
var _running := false
var _reverse := false
var _completed := false
var _in_sequence := false

var _loop_count := EMPTY_LOOP_COUNT
var _loop_type := LoopTypes.Restart as String

var _on_started := {"func_ref":null,"args":[]}
var _on_update := {"func_ref":null,"args":[]}
var _on_loop_completed := {"func_ref":null,"args":[]}
var _on_completed := {"func_ref":null,"args":[]}


func _is_easing_completed() -> bool:
	return _get_elapsed_time() == _get_duration() and _is_completed() == false


func _is_easing_in_progress() -> bool:
	return _get_elapsed_time() <= _get_duration()


func _get_time_normalized() -> float:
	return _get_elapsed_time() / _get_duration()


func _set_easing(value) -> void:
	_easing = value


func _get_easing():
	return _easing


func _set_elapsed_time(value: float) -> void:
	_elapsed_time = value
	_elapsed_time = clamp(_get_elapsed_time(), EMPTY_TIME, _get_duration())


func _get_elapsed_time() -> float:
	return _elapsed_time


func _set_duration(value: float) -> void:
	_duration = value


func _get_duration() -> float:
	return _duration


func _set_delay(value: float) -> void:
	_delay = value


func _get_delay() -> float:
	return _delay


func _has_delay() -> bool:
	return _get_delay() > EMPTY_TIME
	

func _set_speed_scale(value: float) -> void:
	_speed_scale = value


func _get_speed_scale() -> float:
	return _speed_scale


func _set_started(value: bool) -> void:
	_started = value
	

func _get_started() -> bool:
	return _started


func _is_started() -> bool:
	return _get_started()


func _set_running(value: bool) -> void:
	_running = value
	

func _get_running() -> bool:
	return _running


func _is_running() -> bool:
	return _get_running()


func _set_reverse(value: bool) -> void:
	_reverse = value
	

func _get_reverse() -> bool:
	return _reverse


func _is_reverse() -> bool:
	return _get_reverse()
	

func _set_completed(value: bool) -> void:
	_completed = value
	

func _get_completed() -> bool:
	return _completed


func _is_completed() -> bool:
	return _get_completed()


func _set_in_sequence(value: bool) -> void:
	_in_sequence = value


func _get_in_sequence() -> bool:
	return _in_sequence


func _in_sequence() -> bool:
	return _get_in_sequence()


func _is_sequence() -> void:
	_set_in_sequence(true)


func _set_loop_count(value: int) -> void:
	_loop_count = value


func _get_loop_count() -> int:
	return _loop_count


func _has_loops() -> bool:
	return _get_loop_count() != EMPTY_LOOP_COUNT


func _is_loop_infinity() -> bool:
	return _get_loop_count() == INFINITY_LOOP_COUNT


func _set_loop_type(value: String) -> void:
	_loop_type = value


func _get_loop_type() -> String:
	return _loop_type
