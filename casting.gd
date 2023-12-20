extends RayCast3D

signal interact_enter
signal interact_exit
signal interacting
var interact_active:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_colliding() != interact_active:
		if is_colliding():
			print(get_collider())
			interact_active = true
			emit_signal("interact_enter")
		else:
			interact_active = false
			emit_signal("interact_exit")
	
	if is_colliding():
		if Input.is_action_just_pressed("interact"):
			emit_signal("interacting")
			print("interacted")

