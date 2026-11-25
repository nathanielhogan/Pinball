extends Node

var score = 0

var debug = false

func reset() -> void:
	get_tree().reload_current_scene()
	score = 0
