class_name Serialization
extends Reference


static func save_to_file(data,save_path: String) -> void:
	var dir := Directory.new()
	var dir_path := save_path.get_base_dir() + "/"
	var extension := save_path.get_extension()
	var file_path := save_path.get_file()
	var path := dir_path + file_path
	
	if not dir.dir_exists(dir_path):
		dir.make_dir_recursive(dir_path)
		
	var file := File.new()
	var error := file.open(path, File.WRITE)
	
	if error == OK:
		file.store_var(data)
	file.close()


static func load_from_file(save_path: String,data_default = null):
	var dir := Directory.new()
	var dir_path := save_path.get_base_dir() + "/"
	var file_path := save_path.get_file()
	var path := dir_path + file_path
	var data = null
	
	if not dir.dir_exists(dir_path):
		dir.make_dir_recursive(dir_path)
		
	var file := File.new()
	if file.file_exists(path):
		var error := file.open(path, File.READ)

		if error == OK:
			data = file.get_var()
	else:
		if data_default == null:
			return null
		var error := file.open(path, File.WRITE)
		if error == OK:
			file.store_var(data_default)
	file.close()
	return data
