class_name ArrayHelper
extends Reference


static func create_array() -> ArrayCore:
	return ArrayCore.new()


static func create_sparse_array(default_value) -> SparseArray:
	return SparseArray.new(default_value)
