extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ray_cast_3d_interact_enter():
	get_node("Label").text = "°"

func _on_ray_cast_3d_interact_exit():
	get_node("Label").text = "."
