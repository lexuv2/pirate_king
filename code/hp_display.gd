extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export var  hp_num = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_node("/root/root/player").hp) < hp_num:
		queue_free()
	pass
