class_name DataStorage
extends Reference


static func save_data(path: String,data: Dictionary) -> void:
	var file := File.new()
	var err := file.open(path, File.WRITE)
	if err != OK:
		return
	file.store_var(data)
	file.close()


static func load_data(path: String) -> Dictionary:
	var file := File.new()
	var err := file.open(path, File.READ)
	if err != OK:
		return {}
	var data := {}
	var data_file := file.get_var() as Dictionary
	data = data_file
	return data
