extends CharacterBody2D
@onready var sprite = $Sprite2D
@onready var leftbumper = get_node("LeftBumper")
@onready var rightbumper = get_node("RightBumper")


func _ready() -> void:
	pass

# play animation
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Press"):
		for i in range(3):
			leftbumper.rotation_degrees += -15
			rightbumper.rotation_degrees += 15
		await get_tree().create_timer(.1).timeout
		for i in range(3):
			leftbumper.rotation_degrees += 15
			rightbumper.rotation_degrees += -15

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
