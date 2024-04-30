class_name PickupArea2D
extends AreaCore2D

signal pickup_collected(pickup)


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(pickup: Area2D) -> void:
	if pickup.has_method("collect"):
		pickup.collect()
		emit_signal("pickup_collected", pickup)
