extends Reference


static func get_global_rotation_degrees_property(target: Object,axis: String = "") -> String:
	if target is Spatial:
		if axis != "":
			return "global_rotation_degrees:%s" % axis
	elif target is Node2D:
		return "global_rotation_degrees"
	elif target is Control:
		return "rect_rotation"
	return ""


static func get_rotation_degrees_property(target: Object,axis: String = "") -> String:
	if target is Spatial:
		if axis != "":
			return "rotation_degrees:%s" % axis
	elif target is Node2D:
		return "rotation_degrees"
	elif target is Control:
		return "rect_rotation"
	return ""


static func get_global_rotation_property(target: Object,axis: String = "") -> String:
	if target is Spatial:
		if axis != "":
			return "global_rotation:%s" % axis
	elif target is Node2D:
		return "global_rotation"
	elif target is Control:
		return "rect_rotation"
	return ""


static func get_rotation_property(target: Object,axis: String = "") -> String:
	if target is Spatial:
		if axis != "":
			return "rotation:%s" % axis
	elif target is Node2D:
		return "rotation"
	elif target is Control:
		return "rect_rotation"
	return ""


static func get_scale_property(target: Object,axis: String = "") -> String:
	if target is Node2D or target is Spatial:
		if axis != "":
			return "scale:%s" % axis
		else:
			return "scale"
	elif target is Control:
		if axis != "":
			return "rect_scale:%s" % axis
		else:
			return "rect_scale"
	return ""


static func get_global_position_property(target: Object,axis: String = "") -> String:
	if target is Node2D:
		if axis != "":
			return "position:%s" % axis
		else:
			return "position"
	elif target is Spatial:
		if axis != "":
			return "translation:%s" % axis
		else:
			return "translation"
	elif target is Control:
		if axis != "":
			return "rect_position:%s" % axis
		else:
			return "rect_position"
	return ""


static func get_position_property(target: Object,axis: String = "") -> String:
	if target is Node2D:
		if axis != "":
			return "position:%s" % axis
		else:
			return "position"
	elif target is Spatial:
		if axis != "":
			return "translation:%s" % axis
		else:
			return "translation"
	elif target is Control:
		if axis != "":
			return "rect_position:%s" % axis
		else:
			return "rect_position"
	return ""
