class_name StatusReceiver2D
extends Component2D

signal status_effect_added(effect)
signal status_effect_remove(effect)

var status_effects := [] setget set_status_effects,get_status_effects


func _physics_process(delta: float) -> void:
	for index in status_effects.size():
		var effect := status_effects[index] as Resource
		effect.duration -= delta
		
		if effect.get_duration() < 0:
			effect.remove(self)
			status_effects.remove(index)
			emit_signal("status_effect_remove", effect)
			break


func apply_status_effect(effect: Resource) -> void:
	status_effects.append(effect)
	effect.apply(self)
	emit_signal("status_effect_added", effect)


func set_status_effects(value: Array) -> void:
	status_effects = value


func get_status_effects() -> Array:
	return status_effects
