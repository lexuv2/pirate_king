extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(global_position)
	pass

export (PackedScene) var mob

func _on_Timer_timeout():
	if ($Timer.wait_time > 1):
		$Timer.wait_time*=0.98
	
	var inst = mob.instance()
	inst.position=position
	#print(global_position)
	get_node("/root/root").add_child(inst)
	
	
	
	pass # Replace with function body.
