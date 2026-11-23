extends RigidBody2D

var velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()

var temp = 0
var start_position = Vector2(460, 585.0453)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	position = start_position
	
	pass


func _process(_delta: float) -> void:
	# set a maximum velocity if needed
	max_velocity(5000)
	
	
	
	#prints launch velocity
	if(abs(linear_velocity.y) > 0 and temp < 1):
		temp += 1
		print(linear_velocity)
		can_sleep = false


func max_velocity(max) -> void:
	
	var scalar_velocity = sqrt(linear_velocity.x **2 + linear_velocity.y ** 2)
	
	if scalar_velocity > max:
		linear_velocity.x = linear_velocity.x * max / scalar_velocity
		linear_velocity.y = linear_velocity.y * max / scalar_velocity

func _on_body_entered(body: Node) -> void:
	if body.name in ["Edges"]:
		
		Global.score += 1
		print(Global.score)
