extends CanvasLayer

@onready var box:ColorRect = get_node("textbox")
@onready var text:Label = get_node("textbox/text")
@onready var ttt:Timer = get_node("ttt")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ray_cast_3d_interacting():
	box.visible = true
	text.text = "strange"
	ttt.start()

func _on_timer_timeout():
	box.visible = false
	text.text = ""
	if get_tree().current_scene.name == "world3":
		get_tree().change_scene_to_file("res://main.tscn")
	else:
		get_tree().change_scene_to_file("res://world_3.tscn")
