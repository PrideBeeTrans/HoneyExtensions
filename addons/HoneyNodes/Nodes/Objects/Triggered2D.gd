class_name Triggered2D
extends AreaCore2D

signal triggered()


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(area: Area2D) -> void:
	emit_signal("triggered")
