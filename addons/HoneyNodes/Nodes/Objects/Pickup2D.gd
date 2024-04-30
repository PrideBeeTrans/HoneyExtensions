class_name Pickup2D
extends AreaCore2D

signal collected()


func collect() -> void:
	emit_signal("collected")
