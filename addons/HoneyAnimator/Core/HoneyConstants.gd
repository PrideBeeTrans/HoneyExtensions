extends Reference

const EasingsData := preload("res://addons/HoneyAnimator/Core/Easings/EasingData.tres").data
const EasingNames := EasingsData.EasingNames
const EasingData := EasingsData.EasingData


static func get_local_position_property(target: Object, axis: String = "") -> String:
	if target is Node2D or target is Spatial:
		if axis != "":
			return "position:" + axis
		else:
			return "position"
	elif target is Control:
		if axis != "":
			return "rect_position:" + axis
		else:
			return "rect_position"
	return ""


static func get_position_property(target: Object, axis: String = "") -> String:
	if target is Node2D or target is Spatial:
		if axis != "":
			return "global_position:" + axis
		else:
			return "global_position"
	elif target is Control:
		if axis != "":
			return "rect_global_position:" + axis
		else:
			return "rect_global_position"
	return ""


static func get_scale_property(target: Object, axis: String = "") -> String:
	if target is Node2D or target is Spatial:
		if axis != "":
			return "scale:" + axis
		else:
			return "scale"
	elif target is Control:
		if axis != "":
			return "rect_scale:" + axis
		else:
			return "rect_scale"
	return ""


static func get_rotation_property(target: Object, axis: String = "") -> String:
	if target is Node2D or target is Spatial:
		if axis != "":
			return "rotation:" + axis
		else:
			return "rotation"
	elif target is Control:
		if axis != "":
			return "rect_rotation:" + axis
		else:
			return "rotation"
	return ""


static func get_rotation_degrees_property(target: Object, axis: String = "") -> String:
	if target is Node2D or target is Spatial:
		if axis != "":
			return "rotation_degrees:" + axis
		else:
			return "rotation_degrees"
	elif target is Control:
		return "rect_rotation"
	return ""
