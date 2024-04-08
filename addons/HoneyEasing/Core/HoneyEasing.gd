class_name HoneyEasing
extends Reference

const LoopTypes := HoneyEasingConstants.LoopTypes


static func create_honey_easing(node: Node) -> HoneyEasingData:
	return HoneyEasingData.new(node)


class HoneyEasingData:
	const HoneyEasing_Name := "HoneyEasing"
	const ProcessMode := {
		"Idle":"Idle",
		"Physics":"Physics",
	}
	
	var _properties := {}
	
	
	func _init(node: Node) -> void:
		_initialize(node)
	
	
	func _initialize(node: Node) -> void:
		_initialize_properties(node)
		_connect_signals()
	
	
	func _initialize_properties(node: Node) -> void:
		_add_properties("node", node)
		_add_properties("tree", Engine.get_main_loop())
		_add_properties("honey_easings", [])
		_add_properties("speed_scale", 1.0)
		_add_properties("started", false)
		_add_properties("paused", false)
		_add_properties("running", false)
		_add_properties("auto_start", true)
		_add_properties("process_mode", ProcessMode.Idle)
	
	
	func _connect_signals() -> void:
		_connect_tree()
	
	
	func _connect_tree() -> void:
		if _get_tree().has_meta(HoneyEasing_Name):
			_get_tree().set_meta(HoneyEasing_Name, self)
		_get_tree().connect("idle_frame", self, "_update")


	func _update() -> void:
		if is_started() == true or is_auto_start() == true or is_paused() == false:
			_process_easing()
	
	
	func ease_scale(target: Object,to_value,duration: float) -> HoneyEasingProperty:
		return ease_property(target, "scale", to_value, duration)
	
	
	func ease_property(target: Object,property: NodePath,to_value,duration: float) -> HoneyEasingProperty:
		var honey_ease_property := HoneyEasingProperty.new(self, target, property, to_value, duration)
		_get_honey_easings().append(honey_ease_property)
		return honey_ease_property
	
	
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
		_set_properties("node", value)
		
	
	func _get_node() -> Node:
		return _get_properties("node")
	
	
	func _set_tree(value: SceneTree) -> void:
		_set_properties("tree", value)
	
	
	func _get_tree() -> SceneTree:
		return _get_properties("tree")
	
	
	func _add_honey_easing(value: Object) -> void:
		_get_honey_easings().append(value)
	
	
	func _set_honey_easings(value: Array) -> void:
		_set_properties("honey_easings", value)
	
	
	func _get_honey_easings() -> Array:
		return _get_properties("honey_easings")
	
	
	func set_speed_scale(value: float) -> void:
		_set_properties("speed_scale", value)
	
	
	func get_speed_scale() -> float:
		return _get_properties("speed_scale")
	
	
	func set_started(value: bool) -> void:
		_set_properties("started", value)
	
	
	func is_started() -> bool:
		return _get_properties("started")
	
	
	func set_paused(value: bool) -> void:
		_set_properties("paused", value)
	
	
	func is_paused() -> bool:
		return _get_properties("paused")
	
	
	func set_running(value: bool) -> void:
		_set_properties("running", value)
	
	
	func is_running() -> bool:
		return _get_properties("running")
	
	
	func set_auto_start(value: bool) -> void:
		_set_properties("auto_start", value)
	
	
	func is_auto_start() -> bool:
		return _get_properties("auto_start")
	
	
	func _add_properties(property_name: String,value) -> void:
		if not _properties.has(property_name):
			_properties[property_name] = value


	func _set_properties(property_name: String,value) -> void:
		_properties[property_name] = value


	func _get_properties(property_name: String):
		return _properties[property_name]


class HoneySequence:
	const HoneySequence_Name := "HoneySequence"
	
	var _properties := {}
	
	
	func _init() -> void:
		_initialize()
	
	
	func _initialize() -> void:
		_initialize_properties()
		_connect_signals()
	
	
	func _initialize_properties() -> void:
		_add_properties("tree", Engine.get_main_loop())
		_add_properties("honey_easings", [])
	
	
	func _connect_signals() -> void:
		_connect_tree()
	
	
	func _connect_tree() -> void:
		if not _get_tree().has_meta(HoneySequence_Name):
			_get_tree().set_meta(HoneySequence_Name, [])
		_get_tree().connect("idle_frame", self, "start_next")
	
	
	func append(honey_easing: Object) -> HoneySequence:
		_get_honey_easings().append(honey_easing)
		honey_easing._is_sequence()
		return self
	
	
	func _set_honey_easings(value: Array) -> void:
		_set_properties("honey_easings", value)
	
	
	func _get_honey_easings() -> Array:
		return _get_properties("honey_easings")
	
	
	func _set_tree(value: SceneTree) -> void:
		_set_properties("tree", value)
	
	
	func _get_tree() -> SceneTree:
		return _get_properties("tree")
	
	
	func _add_properties(property_name: String,value) -> void:
		if not _properties.has(property_name):
			_properties[property_name] = value


	func _set_properties(property_name: String,value) -> void:
		_properties[property_name] = value


	func _get_properties(property_name: String):
		return _properties[property_name]


class HoneyEasingProperty extends HoneyEasingCore:
	signal easing_step(easing_value)
	

	func _init(honey_easing: Object,target: Object,property: NodePath,to_value,duration: float) -> void:
		_add_properties("target", target)
		_add_properties("property", property)
		_add_properties("from", _get_target().get_indexed(property))
		_add_properties("to", to_value)
		_add_properties("is_from", true)
		_add_properties("as_relative", false)
		_set_honey_easing(honey_easing)
		_set_duration(duration)
	
	
	func _easing_step() -> void:
		var time_normalized := _get_elapsed_time() / _get_duration()
		var easing_value =  _get_from() + (_get_to() - _get_from()) * time_normalized
		_get_target().set(_get_property(), easing_value)
	
	
	func from(value) -> HoneyEasingProperty:
		_set_from(value)
		_set_is_from(false)
		return self
	
	
	func from_current() -> HoneyEasingProperty:
		_set_is_from(false)
		return self
	
	
	func as_relative() -> HoneyEasingProperty:
		_set_as_relative(true)
		return self
	
	
	func _check_loop_type() -> void:
		if _get_loop_type() == LoopType.Restart:
			_get_target().set(_get_property(), _get_from())
		if _get_loop_type() == LoopType.YoyoYoyo:
			var old_from = _get_from()
			var old_to = _get_to()
			_set_to(old_from)
			_set_from(old_to)
			_get_target().set(_get_property(), _get_from())
	
	
	func _set_target(value: Object) -> void:
		_set_properties("target", value)
	
	
	func _get_target() -> Object:
		return _get_properties("target")
		
	
	func _set_property(value: NodePath) -> void:
		_set_properties("property", value)
	
	
	func _get_property() -> NodePath:
		return _get_properties("property")
	
	
	func _set_from(value) -> void:
		_set_properties("from", value)
	
	
	func _get_from():
		return _get_properties("from")
	

	func _set_to(value) -> void:
		_set_properties("to", value)
	
	
	func _get_to():
		return _get_properties("to")
		
	
	func _set_is_from(value) -> void:
		_set_properties("is_from", value)
	
	
	func _is_from() -> bool:
		return _get_properties("is_from")
	
	
	func _set_as_relative(value) -> void:
		_set_properties("as_relative", value)
	
	
	func _as_relative() -> bool:
		return _get_properties("as_relative")
