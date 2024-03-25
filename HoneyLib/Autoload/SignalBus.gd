extends Node

var events := {}


func add_event(event_name: String) -> void:
	if not events.has(event_name):
		events[event_name] = []


func add_listener(event_name: String, callback: String, object: Object) -> void:
	if events.has(event_name):
		events[event_name].append({"callback": callback, "object": object})
	else:
		events[event_name] = []
		events[event_name].append({"callback": callback, "object": object})


# Função para remover eventos
func remove_event(event_name: String, callback: String, object: Object) -> void:
	if events.has(event_name):
		var callbacks := events[event_name] as Array
		for i in range(callbacks.size()):
			var entry := callbacks[i] as Dictionary
			if entry["callback"] == callback and entry["object"] == object:
				callbacks.remove(i)
				return

# Função para emitir eventos
func emit_event(event_name: String, args: Dictionary = {}):
	if events.has(event_name):
		var callbacks := events[event_name] as Array
		if callbacks.size() > 1:
			for callback_entry in callbacks:
				var callback := callback_entry["callback"] as String
				var obj := callback_entry["object"] as Object
				# Chamando os callbacks associados ao evento
				if args.size() > 0:
					obj.call(callback, args)
				else:
					obj.call(callback)
		else:
			var callback_entry := callbacks[0] as Dictionary
			var callback := callback_entry["callback"] as String
			var obj := callback_entry["object"] as Object
			# Chamando os callbacks associados ao evento
			if args.size() > 0:
				obj.call(callback, args)
			else:
				obj.call(callback)
			
	else:
		print("Nenhum inscrito para o evento:", event_name)
