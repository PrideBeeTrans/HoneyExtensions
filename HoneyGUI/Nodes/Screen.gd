class_name Screen
extends Control


func _ready() -> void:
	reset()


func reset() -> void:
	hide()


func anim_in() -> void:
	show()


func anim_out() -> void:
	hide()


func enter(msg: Dictionary = {}) -> void:
	pass
