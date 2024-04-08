class_name HoneyEasing
extends Reference


static func create_honey_easing(node: Node) -> HoneyEasingData:
	return HoneyEasingData.new(node)


class HoneyEasingData:
	const Propertys := preload("res://addons/HoneyEasing/Core/HoneyConstants.gd")
	const HoneyEasing_Name := "HoneyEasing"
	const ProcessMode := {
		"Idle":"Idle",
		"Physics":"Physics",
	}
	
	var _node : Node
	var _tree := Engine.get_main_loop() as SceneTree
	var _honey_easings := []
	var _speed_scale := 1.0
	
	var _started := false
	var _running := false
	var _paused := false
	var _auto_start := true
	
	
	func _init(node: Node) -> void:
		_node = node
		_connect_signals()
	
	
	func _connect_signals() -> void:
		_connect_tree()
	
	
	func _connect_tree() -> void:
		if not _get_tree().has_meta(HoneyEasing_Name):
			_get_tree().set_meta(HoneyEasing_Name, self)
		_get_tree().connect("idle_frame", self, "_update")


	func _update() -> void:
		if is_started() == true or is_auto_start() == true or is_paused() == false:
			_process_easing()
	
	
	func animate_squash(target: Object,squash_intensity: float,scale_base,duration: float) -> HoneyProperty:
		var squash_scale
		if target is Node2D or target is Control:
			squash_scale = Vector2(1+ squash_intensity,1- squash_intensity)
		else:
			squash_scale = Vector3.ONE
		return animate_scale(target, squash_scale, duration)
	
	
	func animate_stretch(target: Object,stretch_intensity: float,scale_base,duration: float) -> HoneyProperty:
		var stretch_scale
		if target is Node2D or target is Control:
			stretch_scale = Vector2(1- stretch_intensity,1+ stretch_intensity)
		else:
			stretch_scale = Vector3.ONE
		return animate_scale(target, stretch_scale, duration)
	
	
	func animate_rotation_degrees(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_global_rotation_degrees_property(target)
		return animate_property(target, property, to_value, duration)
	
	
	func animate_rotation_degrees_x(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_global_rotation_degrees_property(target, "x")
		return animate_property(target, property, to_value, duration)


	func animate_rotation_degrees_y(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_global_rotation_degrees_property(target, "y")
		return animate_property(target, property, to_value, duration)
		
		
	func animate_rotation_degrees_z(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_global_rotation_degrees_property(target, "z")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_rotation_degrees(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_rotation_degrees_property(target)
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_rotation_degrees_x(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_rotation_degrees_property(target, "x")
		return animate_property(target, property, to_value, duration)


	func animate_local_rotation_degrees_y(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_rotation_degrees_property(target, "y")
		return animate_property(target, property, to_value, duration)
		
		
	func animate_local_rotation_degrees_z(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_rotation_degrees_property(target, "z")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_rotation(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_global_rotation_property(target)
		return animate_property(target, property, to_value, duration)
	
	
	func animate_rotation_x(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_global_rotation_property(target, "x")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_rotation_y(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_global_rotation_property(target, "y")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_rotation_z(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_global_rotation_property(target, "z")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_rotation(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_rotation_property(target)
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_rotation_x(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_rotation_property(target, "x")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_rotation_y(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_rotation_property(target, "y")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_rotation_z(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_rotation_property(target, "z")
		return animate_property(target, property, to_value, duration)
	

	func animate_scale(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_scale_property(target)
		return animate_property(target, property, to_value, duration)
	
	
	func animate_scale_x(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_scale_property(target, "x")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_scale_y(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_scale_property(target, "y")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_scale_z(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_scale_property(target, "z")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_move(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_position_property(target)
		return animate_property(target, property, to_value, duration)
	
	
	func animate_move_x(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_position_property(target, "x")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_move_y(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_position_property(target, "y")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_move_z(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_position_property(target, "z")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_move(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_position_property(target)
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_move_x(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_position_property(target, "x")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_move_y(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_position_property(target, "y")
		return animate_property(target, property, to_value, duration)
	
	
	func animate_local_move_z(target: Object,to_value,duration: float) -> HoneyProperty:
		var property := Propertys.get_position_property(target, "z")
		return animate_property(target, property, to_value, duration)

	
	func animate_property(target: Object,property: NodePath,to_value,duration: float) -> HoneyProperty:
		if target.get(property) == null:
			return null
	
		if not target.get(property) != typeof(target.get(property)):
			return null
		
		if not property.is_empty() == true:
			var honey_ease_property := HoneyProperty.new(target, property, to_value, duration)
			_get_honey_easings().append(honey_ease_property)
			return honey_ease_property
		return null
	
	
	func _process_easing() -> void:
		var delta := _get_node().get_process_delta_time()
		
		for honey_ease in _get_honey_easings():
			honey_ease._process_easing(delta)
	
	
	func play() -> void:
		set_started(true)
		set_paused(false)
		set_running(true)
	
	
	func pause() -> void:
		set_paused(true)
		set_running(false)
	
	
	func resume() -> void:
		set_paused(false)
		set_running(true)
	
	
	func stop() -> void:
		set_started(false)
		set_paused(false)
		set_running(false)
	
	
	func is_valid() -> bool:
		return not _get_honey_easings().empty()
	
	
	func _set_node(value: Node) -> void:
		_node = value
		
	
	func _get_node() -> Node:
		return _node
	
	
	func _set_tree(value: SceneTree) -> void:
		_tree = value 
	
	
	func _get_tree() -> SceneTree:
		return _tree
	
	
	func _add_honey_easing(value: Object) -> void:
		_get_honey_easings().append(value)
	
	
	func _set_honey_easings(value: Array) -> void:
		_honey_easings = value
	
	
	func _get_honey_easings() -> Array:
		return _honey_easings
	
	
	func set_speed_scale(value: float) -> void:
		_speed_scale = value
	
	
	func get_speed_scale() -> float:
		return _speed_scale
	
	
	func set_started(value: bool) -> void:
		_started = value
	
	
	func is_started() -> bool:
		return _started
	
	
	func set_paused(value: bool) -> void:
		_paused = value
	
	
	func is_paused() -> bool:
		return _paused
	
	
	func set_running(value: bool) -> void:
		_running = value
	
	
	func is_running() -> bool:
		return _running
	
	
	func set_auto_start(value: bool) -> void:
		_auto_start = value
	
	
	func is_auto_start() -> bool:
		return _auto_start
