class_name CollectableArea2D
extends Area2D

signal collected(collectable)


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(collectable: Area2D) -> void:
	if collectable.has_method("collected"):
		collectable.collected()
		emit_signal("collected", collectable)
