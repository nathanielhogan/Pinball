extends CharacterBody2D
var rng = RandomNumberGenerator.new()
var mouse_hover = false



var dragging = false
var click_radius = 8 # Size of the sprite.


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if (event.position - position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging and event.pressed:
				dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false
			position.y = 600

	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		if event.position.y > 600 and event.position.y < 700:
			position.y = event.position.y






func _physics_process(delta: float) -> void:
	pass
	


	
	
	#if Input.is_action_pressed("Shoot"):
		#
		#position = get_global_mouse_position()
		###print("hi")
		###Vector2((100 * rng.randf_range(-1, 0)), -2000)
		###translate(Vector2(0, 500 - position.y))
		##var movespeed = 40
		##var weight: float = 1.0 - exp(-movespeed * delta)
###
		##position.y = 500
		###= lerp(600, 200, weight)
		
		
		
		
	#pass


	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
