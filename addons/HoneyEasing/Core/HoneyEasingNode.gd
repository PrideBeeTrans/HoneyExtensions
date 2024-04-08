extends Node


func _ready() -> void:
	var honey_easing := HoneyEasing.create_honey_easing(self)
	honey_easing.ease_property($Sprite, "position", Vector2(200,200), 0.5)
