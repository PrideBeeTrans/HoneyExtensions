tool
class_name HoneyTimer
extends TimerCore


func _get_property_list() -> Array:
	var properties := []
	properties.append({"name":"HoneyTimer","type":TYPE_NIL,"usage":PROPERTY_USAGE_CATEGORY})
	properties.append({"name":"auto_start","type":TYPE_BOOL})
	properties.append({"name":"Time Execution","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"process_mode","type":TYPE_INT,"hint":PROPERTY_HINT_ENUM,"hint_string":"Idle,Physics"})
	properties.append({"name":"wait_time","type":TYPE_REAL,"hint":PROPERTY_HINT_RANGE,"hint_string":"0.001,4096"})
	properties.append({"name":"one_shot","type":TYPE_BOOL})
	if is_one_shot() == true:
		properties.append({"name":"repeat_count","type":TYPE_INT})
	properties.append({"name":"Time Limits","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"max_time","type":TYPE_REAL})
	properties.append({"name":"min_time","type":TYPE_REAL})
	properties.append({"name":"Time Scale","type":TYPE_NIL,"usage":PROPERTY_USAGE_GROUP})
	properties.append({"name":"time_scale","type":TYPE_REAL})
	properties.append({"name":"speed_factor","type":TYPE_REAL})
	return properties
