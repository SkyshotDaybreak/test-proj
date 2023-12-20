extends CharacterBody3D

@export var speed = 10
@export var jump_velocity = 5

var look_sensitivity = ProjectSettings.get_setting("player/look_sensitivity")
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var vel_y = 0

@onready var camera:Camera3D = $Camera3D
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	# move/jump
	var horz_vel = Input.get_vector("move_left","move_right","move_forward","move_backward").normalized() * speed
	velocity = horz_vel.x * global_transform.basis.x + horz_vel.y * global_transform.basis.z
	if is_on_floor():
		vel_y = jump_velocity if Input.is_action_just_pressed("jump") else 0
	else:
		vel_y -= gravity * delta
	velocity.y = vel_y
	move_and_slide()
	
	# mouse capture
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
	# sensitivity 0 code here somewhere
		if look_sensitivity != 0:
			look_sensitivity = 0
		else:
			look_sensitivity = ProjectSettings.get_setting("player/look_sensitivity")
	
	
func _input(event):
	# mouse sensitivity
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
