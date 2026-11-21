extends Area2D

@export var launch_force: float = 900.0
@export var launch_direction: Vector2 = Vector2(1, -1)

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Baller":
		print("hit ball!")
		var direction = launch_direction.normalized()

		body.apply_central_impulse(direction * launch_force)
