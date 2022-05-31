extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(global_position)
	pass

var mobs = [load("res://scenes/enemy.tscn"),load("res://scenes/enemy_bat.tscn"),load("res://scenes/enemy_ghost.tscn"),load("res://scenes/enemy_slime.tscn"),load("res://scenes/enemy_spider.tscn")]

func _on_Timer_timeout():
	if ($Timer.wait_time > 0.3):
		$Timer.wait_time*=0.985
	#if randi()%6 == 0:
	#	var loot = load("res://power_up.tscn")
	#	loot = loot.instance()
	#	get_node("/root/root").add_child(loot)
	#	loot.global_position=global_position
	var mob = mobs[randi()%mobs.size()]
	for i in randi()%5:
		
		var inst = mob.instance()
	#inst.global_position=global_position
	#print(global_position)
		get_node("/root/root").add_child(inst)
		inst.global_position.x=global_position.x+randi()%128
		inst.global_position.y=global_position.y+randi()%128
	
	
	
	pass # Replace with function body.
