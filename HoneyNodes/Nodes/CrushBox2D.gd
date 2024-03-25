class_name CrushBox2D
extends TriggeredArea2D

signal crushed()


func _on_body_entered(body: Node2D) -> void:
	emit_signal("crushed")
