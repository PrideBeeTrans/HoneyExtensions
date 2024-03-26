extends Node

const MIN_INDEX := 1
const START_INDEX := 0
const EMPTY_INDEX := 0
const EMPTY_DICTIONARY := {}
const EMPTY_ARRAY := []

var events := EMPTY_DICTIONARY


func add_event(event_name: String) -> void:
	if not has_event(event_name):
		set_event(event_name, EMPTY_ARRAY)


func add_listener(event_name: String, callback: String, object: Object) -> void:
	if has_event(event_name):
		get_event(event_name).append({"callback": callback, "object": object})
	else:
		set_event(event_name, EMPTY_ARRAY)
		get_event(event_name).append({"callback": callback, "object": object})


func get_listener(event_name: String,index: int) -> Dictionary:
	return get_event(event_name)[index]


func get_listener_callback(event_name: String,index: int) -> String:
	return get_listener(event_name, index)["callback"]


func get_listener_object(event_name: String,index: int) -> Object:
	return get_listener(event_name, index)["object"]


func remove_event(event_name: String, callback: String, object: Object) -> void:
	if has_event(event_name):
		var callbacks := get_event(event_name) as Array
		for index in range(callbacks.size()):
			var entry := get_listener(event_name, index) as Dictionary
			var entry_callback := get_listener_callback(event_name, index)
			var entry_object := get_listener_object(event_name, index)
			
			if entry_callback == callback and entry_object == object:
				callbacks.remove(index)
				return


func emit_event(event_name: String, args: Dictionary = {}) -> void:
	if has_event(event_name):
		var callbacks := get_event(event_name) as Array
		if callbacks.size() > MIN_INDEX:
			for index in callbacks.size():
				var callback := get_listener_callback(event_name, index)
				var object := get_listener_object(event_name, index)
				if args.size() > EMPTY_INDEX:
					object.call(callback, args)
				else:
					object.call(callback)
		else:
			var callback := get_listener_callback(event_name, START_INDEX) as String
			var object := get_listener_object(event_name, START_INDEX) as Object
			if args.size() > 0:
				object.call(callback, args)
			else:
				object.call(callback)
			
	else:
		push_error("No event with this name %s" % event_name)


func has_event(event_name: String) -> bool:
	return events.has(event_name)


func set_event(event_name: String,value) -> void:
	if has_event(event_name):
		events[event_name] = value

	
func get_event(event_name: String) -> Array:
	if has_event(event_name):
		return events[event_name]
	return EMPTY_ARRAY
