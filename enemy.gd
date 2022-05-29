extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var hp =2
# Called when the node enters the scene tree for the first time.
func _ready():
	var scl = rand_range(1,min(2,   max(1,1+get_node("/root/root").time/(3600*4) )  )     )
	scale*=scl
	hp*=scl*scl
	#print(scl)
	pass # Replace with function body.

var tint_timer =0

export var speed = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var p=  get_node("/root/root/player").global_position
	var v = global_position.direction_to(p)
	if tint_timer>1:
		$Sprite.modulate = Color(1,1,1)
	tint_timer+=1
	move_and_slide(v*speed)
	#print(p)
	#print(position)



func _on_Area2D_body_entered(body):
	#print(body.name)
	#print(owner.get_node("bullet"))
	if (body.is_in_group("bullets")):
		tint_timer=0
		hp-=body.damage
		$SfxrStreamPlayer2D.play()
		$Sprite.modulate = Color(0.5,0,0)
		if hp <= 0:
			var time_sec = get_node("/root/root").time/60
			var mod =int(sqrt(time_sec))
			print(mod)
			if mod ==0:
				mod=1
			if randi()% mod == 0:
				var loot = load("res://power_up.tscn")
				loot = loot.instance()
				get_node("/root/root").add_child(loot)
				loot.global_position=global_position
			queue_free()
		body.hp-=1
		
	pass


