class_name TriggeredArea2D
extends Area2D


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	_connect_area()


func _connect_area() -> void:
	connect("body_entered", self, "_on_body_entered")


func _on_body_entered(body: Node2D) -> void:
	pass
