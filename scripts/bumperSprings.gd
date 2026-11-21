extends Area2D

@export var launch_force: float = 900.0
@export var min_random = .9
@export var max_random = 1.1
@export var launch_direction: Vector2 = Vector2(1, -1)

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Baller":
		print("hit ball!")
		
		#slightly randomize launch direction
		var random_launch_direciton = Vector2(randf_range(min_random, max_random), randf_range(min_random, max_random))
		var direction = launch_direction.normalized() * random_launch_direciton

		body.apply_central_impulse(direction * launch_force)
