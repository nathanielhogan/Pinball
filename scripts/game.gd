extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		Global.reset()
	
	if Input.is_action_just_pressed("Debug"):
		if Global.debug:
			Global.debug = false
			print("Debug Off!")
		elif not Global.debug:
			Global.debug = true
			print("Debug On!")
