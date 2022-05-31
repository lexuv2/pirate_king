extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var end_time = get_node("/root/root").time
	$Label.text="GAME OVER\n Time: "+str(int(end_time)/60)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("/root/root").time=1
	pass


func _on_Button_button_up():
	get_tree().reload_current_scene()
	pass # Replace with function body.
