class_name TimerCore
extends Component

signal time_started()
signal time_stopped()
signal time_finished()
signal time_paused()
signal time_resume()
signal time_restarted()
signal time_repeat_count(count)
signal time_repeat_counted()
signal time_repeat_finished()

enum ProcessMode{IDLE, PHYSICS}

var auto_start := false setget set_auto_start,is_auto_start
var repeat_count := 0 setget set_repeat_count,get_repeat_count

var wait_time := 1.0 setget set_wait_time,get_wait_time
var one_shot := false setget set_one_shot,is_one_shot
var process_mode : int = ProcessMode.IDLE setget set_process_mode,get_process_mode

var max_time := -1.0 setget set_max_time,get_max_time
var min_time := 0.0 setget set_min_time,get_min_time
var time_scale := 1.0 setget set_time_scale,get_time_scale
var speed_factor := 1.0 setget set_speed_factor,get_speed_factor

var time_left := 0.0 setget set_time_left,get_time_left
var elapsed_time := 0.0 setget set_elapsed_time,get_elapsed_time
var active := false setget set_active,is_active
var paused := false setget set_paused,is_paused
var repeat_counter := 0 setget set_repeat_counter,get_repeat_counter


func _ready() -> void:
	if Engine.is_editor_hint() == true:
		return
	_setup_process_mode()
	_setup_timers()
	if is_auto_start() == true:
		start()


func _setup_timers() -> void:
	pass


func _setup_process_mode() -> void:
	if is_process_mode_idle() == true:
		set_process(true)
		set_physics_process(false)
	
	elif is_process_mode_physics() == true:
		set_process(false)
		set_physics_process(true)


func _physics_process(delta: float) -> void:
	_process_tick(delta)


func _process(delta: float) -> void:
	_process_tick(delta)


func _process_tick(delta: float) -> void:
	if Engine.is_editor_hint() == true:
		return
	if is_active() == false or is_paused() == true:
		return
	_tick(delta * time_scale)


func _tick(delta: float) -> void:
	if get_time_left() <= get_min_time():
		set_time_left(get_min_time())
	
	set_elapsed_time(get_elapsed_time() + delta)
	set_time_left(get_time_left() - delta * get_speed_factor())
	
	if get_max_time() >= 0.0 and get_elapsed_time() >= get_max_time():
		stop()
		return
	
	if get_time_left() <= 0.0:
		if is_one_shot() == true:
				if get_repeat_counter() < get_repeat_count():
					set_repeat_counter(get_repeat_counter() + 1)
					set_time_left(get_wait_time())
					emit_signal("time_repeat_counted")
				elif get_repeat_counter() == get_repeat_count():
					emit_signal("time_repeat_finished")
				else:
					set_active(false)
		else:
			set_time_left(get_wait_time())
		emit_signal("time_finished")


func start() -> void:
	set_time_left(get_wait_time())
	set_active(true)
	set_elapsed_time(0.0)
	emit_signal("time_started")


func stop() -> void:
	set_active(false)
	emit_signal("time_stopped")


func pause() -> void:
	set_paused(true)
	emit_signal("time_paused")


func resume() -> void:
	set_paused(false)
	emit_signal("time_resume")


func restart() -> void:
	start()
	emit_signal("time_restarted")


func toggle() -> void:
	set_active(not is_active())


func is_complete() -> bool:
	return not is_active()


func set_wait_time(value: float) -> void:
	wait_time = value


func get_wait_time() -> float:
	return wait_time


func set_one_shot(value: bool) -> void:
	one_shot = value
	property_list_changed_notify()


func is_one_shot() -> bool:
	return one_shot


func set_auto_start(value: bool) -> void:
	auto_start = value


func is_auto_start() -> bool:
	return auto_start


func set_process_mode(value: int) -> void:
	process_mode = value
	
	if is_process_mode_idle() == true:
		set_process(true)
		set_physics_process(false)
	
	elif is_process_mode_physics() == true:
		set_process(false)
		set_physics_process(true)


func get_process_mode() -> int:
	return process_mode


func is_process_mode_idle() -> bool:
	return get_process_mode() == ProcessMode.IDLE


func is_process_mode_physics() -> bool:
	return get_process_mode() == ProcessMode.PHYSICS


func set_time_left(value: float) -> void:
	time_left = value


func get_time_left() -> float:
	return time_left


func set_max_time(value: float) -> void:
	max_time = value


func get_max_time() -> float:
	return max_time


func set_min_time(value: float) -> void:
	min_time = value


func get_min_time() -> float:
	return min_time


func set_time_scale(value: float) -> void:
	time_scale = value


func get_time_scale() -> float:
	return time_scale


func set_speed_factor(value: float) -> void:
	speed_factor = value


func get_speed_factor() -> float:
	return speed_factor


func set_elapsed_time(value: float) -> void:
	elapsed_time = value


func get_elapsed_time() -> float:
	return elapsed_time


func set_repeat_counter(value: int) -> void:
	repeat_counter = value
	emit_signal("time_repeat_count", get_repeat_counter())


func get_repeat_counter() -> int:
	return repeat_counter


func set_repeat_count(value: int) -> void:
	repeat_count = value


func get_repeat_count() -> int:
	return repeat_count


func set_active(value: bool) -> void:
	active = value


func is_active() -> bool:
	return active


func set_paused(value: bool) -> void:
	paused = value


func is_paused() -> bool:
	return paused