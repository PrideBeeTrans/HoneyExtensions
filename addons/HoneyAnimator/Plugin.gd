tool
extends EditorPlugin


func _enter_tree() -> void:
	if not Engine.has_singleton("HoneyAnimator"):
		add_autoload_singleton("HoneyAnimator", "res://addons/HoneyAnimator/Core/HoneyAnimator.gd")


func _exit_tree() -> void:
	remove_autoload_singleton("HoneyAnimator")
