tool
extends Node

signal achievement_unlocked(achievement_data)

var achievements := {}


func add_achievement(achievement_data: Dictionary) -> void:
	var achievements_id := achievement_data.id as String
	var achievement_name := achievement_data.name as String
	var achievement_description := achievement_data.description as String
	var achievement_criteria := achievement_data.criteria as String
	
	achievements[achievements_id] = {
		"name":achievement_name,
		"description":achievement_description,
		"criteria":achievement_criteria,
		"unlocked":false,
		"fx":false,
	}


func set_achievement_name(achievement_id: String,achievement_name: String) -> void:
	set_achievement_var(achievement_id, "name", achievement_name)


func set_achievement_description(achievement_id: String,achievement_description: String) -> void:
	set_achievement_var(achievement_id, "description", achievement_description)


func set_achievement_criteria(achievement_id: String,achievement_criteria: String) -> void:
	set_achievement_var(achievement_id, "criteria", achievement_criteria)


func set_achievement_unlocked(achievement_id: String,value : bool) -> void:
	set_achievement_var(achievement_id, "unlocked", value)


func set_achievement_fx(achievement_id: String,value : bool) -> void:
	set_achievement_var(achievement_id, "fx", value)


func unlock_achievement(achievement_id: String) -> void:
	if has_achievement(achievement_id):
		set_achievement_unlocked(achievement_id, true)
		emit_signal("achievement_unlocked", get_achievement(achievement_id))


func lock_achievement(achievement_id: String) -> void:
	if has_achievement(achievement_id):
		set_achievement_unlocked(achievement_id, false)


func is_achievement_unlocked(achievement_id: String) -> bool:
	if not has_achievement(achievement_id):
		return false
	return get_achievement_var(achievement_id, "unlocked")


func list_unlocked_achievements() -> Array:
	var unlocked := []
	for achievement_id in achievements.keys():
		if get_achievement_var(achievement_id, "unlocked"):
			unlocked.append(achievements[achievement_id])
	return unlocked


func list_available_achievements() -> Array:
	var available := []
	for achievement_id in achievements.keys():
		if not get_achievement_var(achievement_id, "unlocked"):
			available.append(achievements[achievement_id])
	return available


func save_achievements() -> void:
	pass
	

func load_achievements() -> void:
	pass


func reset_achievements() -> void:
	for achievement_id in achievements.keys():
		set_achievement_var(achievement_id, "unlocked", false)
		set_achievement_var(achievement_id, "fx", false)


func get_achievement(achievement_id: String) -> Dictionary:
	if not has_achievement(achievement_id):
		return {}
	return achievements[achievement_id]


func set_achievement_var(achievement_id: String,var_name: String,value) -> void:
	if not has_achievement(achievement_id):
		return
	achievements[achievement_id][var_name] = value


func get_achievement_var(achievement_id: String,var_name: String):
	if not has_achievement(achievement_id):
		return null
	return achievements[achievement_id][var_name]


func has_achievement(achievement_id: String) -> bool:
	return achievements.has(achievement_id)
