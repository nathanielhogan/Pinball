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


#squish variables -> only keep if reused maybe?? more obvious what each is
var spring_compress: float = 0.8 # the percentage that the spring compresses ex: 100px -> 20 px will be .8
var plunger_start: float = 620 # the y position that the ball part of the launcher starts
var plunger_end: float = 700 # the farthest y position that you can pull the plunger ball
var plunger_distance: float = plunger_end - plunger_start # the distance over which the plunger is pulled down in pixels
var spring_offset: float = 1 + (spring_compress * plunger_start / plunger_distance) # plugs in start value to find b in slope form, two negatives cancel

var machine_edge = 440 # position of the right ball, used to check if the ball left the launch area

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
			position.y = plunger_start
			squish(1) # resets the spring
			can_move = false
			await get_tree().create_timer(1.5).timeout
			if(baller.position.x > machine_edge):
				print("You have to hit it harder")
				Global.reset()
	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		if event.position.y > plunger_start and event.position.y < plunger_end:
			position.y = event.position.y
			#this is using the puller's position but they are linked so it works
			#percentage spring shrinks
			squish((-spring_compress * position.y / plunger_distance) + spring_offset)







func _physics_process(_delta: float) -> void:
	
	pass

func squish(amount) -> void:
	$Spring.scale = Vector2(1, amount)


	
