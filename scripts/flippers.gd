extends CharacterBody2D
@onready var sprite = $Sprite2D
@onready var leftflipper = get_node("LeftFlipper")
@onready var rightflipper = get_node("RightFlipper")
@export var turnspeed = 40

@export var target_angle_left = deg_to_rad(-37)
@export var target_angle_right = deg_to_rad(37)
@export var angle_offset_amount = 37

var start_angle = deg_to_rad(12)

#@export var starting_angle_left = deg_to_rad(angle_offset_amount)
#@export var starting_angle_right = deg_to_rad(-angle_offset_amount)






func _ready() -> void:
	leftflipper.rotation = start_angle
	rightflipper.rotation = -start_angle


# play animation
func _physics_process(delta: float) -> void:
	var weight: float = 1.0 - exp(-turnspeed * delta)
	if Input.is_action_pressed("ui_left"): #while left arrow pressed
		#for i in range(3):
			#leftbumper.rotation_degrees += -15
			#rightbumper.rotation_degrees += 15
		#await get_tree().create_timer(.1).timeout
		#for i in range(3):
			#leftbumper.rotation_degrees += 15
			#rightbumper.rotation_degrees += -15
		
		leftflipper.rotation = lerp_angle(leftflipper.rotation, target_angle_left, weight) #lerp from starting rotation to target
	if(Input.is_action_just_released("ui_left")): #when left arrow released move back to starting position
		leftflipper.rotation = start_angle
		#leftflipper.rotation = leftflipper.rotation - angle_offset_amount
	if Input.is_action_pressed("ui_right"):
		rightflipper.rotation = lerp_angle(rightflipper.rotation, target_angle_right, weight)
	if(Input.is_action_just_released("ui_right")):
		rightflipper.rotation = -start_angle
		#rightflipper.rotation = rightflipper.rotation + angle_offset_amount
	
	#if Input.is_action_just_released("Press"):
		##while(leftbumper.rotation != starting_angle_left):
			##leftbumper.rotation = lerp_angle(leftbumper.rotation, starting_angle_left, weight)
			##rightbumper.rotation = lerp_angle(rightbumper.rotation, starting_angle_right, weight)
		#leftbumper.rotation = leftbumper.rotation + -12
		#rightbumper.rotation = rightbumper.rotation - -12





#
## convert current rotation into radians
#var current_y_rot = deg2rad( rotation_degrees.y )
#
## variable for new computed rotation
#var new_y_rot = current_y_rot
#
## compute new rotation within the conditional blocks
#if Input.is_action_pressed("move_right"):
	#new_y_rot = lerp_angle( current_y_rot, atan2(0, 1), delta * 7 )
#
#...
#
## store new rotation converting back to degrees first
#rotation_degrees.y = rad2deg( new_y_rot )
