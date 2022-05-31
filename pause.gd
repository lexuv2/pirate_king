extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var pause = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(rect_position)
	if Input.is_action_just_released("ui_cancel")==true:
		if !pause:
			get_tree().paused = true
			show()
			pause = true
		else:
			get_tree().paused = false
			hide()
			pause = false
	pass
