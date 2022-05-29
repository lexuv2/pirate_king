extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if (body.is_in_group("player")):
		var popup = load("res://popup.tscn")
		popup= popup.instance()
		var player = get_node("/root/root/player")
		var type = randi()%4
		var val = rand_range(0.1,1)
		val = stepify(val , 0.1)
		if type == 0:
			popup.get_node("Label").text="+"+str(val)+" Attack Speed"
			if (player.cooldown>1):
				player.cooldown-=val
		if type == 1:
			popup.get_node("Label").text="+1 Penetration"
			player.penetration+=1
		if type == 2:
			popup.get_node("Label").text="+"+str(val)+" Damage"
			player.damage+=val
		if type == 3:
			popup.get_node("Label").text="+"+str(val)+" Additional Bullet Chance"
			player.bullets_chance+=val
		
		get_node("/root/root").add_child(popup)
		popup.position=position
		queue_free()
	pass # Replace with function body.
