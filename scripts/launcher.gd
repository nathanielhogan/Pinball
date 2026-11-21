extends CharacterBody2D

# feels overkill/inneficient but it works
@onready var baller: RigidBody2D = $"../Baller"


var rng = RandomNumberGenerator.new()
var mouse_hover = false

var can_move = false
var starting_position = Vector2(460, 600)

var dragging = false
var click_radius = 8 # Size of the sprite.

func _ready() -> void:
	position = starting_position
	await get_tree().create_timer(.6).timeout
	can_move = true
	
func _input(event):
	if not can_move:
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if (event.position - position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging and event.pressed:
				dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false
			position.y = 600
			can_move = false
			await get_tree().create_timer(1).timeout
			if(baller.position.x == 460):
				print("You have to hit it harder")
				Global.reset()

	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		if event.position.y > 600 and event.position.y < 700:
			position.y = event.position.y
		






func _physics_process(_delta: float) -> void:
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
		
