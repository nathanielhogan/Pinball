extends CharacterBody2D

# feels overkill/inneficient but it works
# @onready var baller: RigidBody2D = $"../Baller"
@export var baller: Node2D

var rng = RandomNumberGenerator.new()
var mouse_hover = false

var can_move = false

### Starting position for first level
#460, 600

var dragging = false
var click_radius = 8 # Size of the sprite.

func _ready() -> void:
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
			position.y = 620
			can_move = false
			await get_tree().create_timer(1.5).timeout
			if(baller.position.x > 440):
				print("You have to hit it harder")
				Global.reset()
	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		if event.position.y > 620 and event.position.y < 700:
			position.y = event.position.y







func _physics_process(_delta: float) -> void:
	pass
