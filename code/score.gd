extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text="Time: " + str( int(get_node("/root/root").time/60) ) 
	pass
