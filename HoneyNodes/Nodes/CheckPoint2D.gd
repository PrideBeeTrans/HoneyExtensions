class_name CheckPoint2D
extends TriggeredArea2D

signal checkpoint_visited()


func _on_body_entered(body: Node2D) -> void:
	checkpoint_entered()


func checkpoint_entered() -> void:
	emit_signal("checkpoint_visited")
	disconnect("body_entered", self, "_on_body_entered")
	set_deferred("monitoring", false)
