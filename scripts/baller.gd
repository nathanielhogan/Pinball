extends RigidBody2D

var velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# Set initial or direct velocity in _ready() or a function
	#linear_velocity = Vector2((100 * rng.randf_range(-1, 0)), -2000) # For RigidBody2D



#
#
#func _process(delta: float) -> void:
	#if Input.is_action_just_released("Shoot"):
		#linear_velocity = Vector2((100 * rng.randf_range(-1, 0)), -2000) # For RigidBody2D
		#
		
		
		
	#func _process(_delta):
	#if Input.is_action_just_pressed("Shoot"):
		#interact_progress_bar.value = 0
	#elif Input.is_action_pressed("Shoot"):
		#interact_progress_bar.value += 1
	#elif Input.is_action_just_released("Shoot"):
		#interact_progress_bar.value = 0

	#if interact_progress_bar.value >= 100:
		#print("HI!")


	#if(linear_velocity.y < 0):
		#linear_velocity.x = linear_velocity.x + (2 * rng.randf_range(-1, 1))
		#
	#print(linear_velocity.x)
