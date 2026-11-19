extends CharacterBody2D


var rng = RandomNumberGenerator.new()
var direction = Vector2.ZERO


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_released("Shoot"):
		print("hi")
		direction.y = -2000
		#Vector2((100 * rng.randf_range(-1, 0)), -2000)
		
	pass


	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
