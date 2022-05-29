extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var Bullet

export var fric = 10
export var max_speed = 100
var v = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
export var speed = 20
func _ready():
	randomize()
	pass # Replace with function body.

var hp =3
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
onready var animation = $AnimationPlayer

var cooldown_timer =0
var cooldown = 20
var penetration =1
var damage = 1
var bullets_chance = 1.0
func _physics_process(delta):
	#print(global_position)
	cooldown_timer+=1
	var inpv = Vector2.ZERO
	
	inpv.x = Input.get_action_strength("ui_right")- Input.get_action_strength("ui_left")
	inpv.y = Input.get_action_strength("ui_down")- Input.get_action_strength("ui_up")
	inpv*=speed
	
	
	
	if v!=Vector2.ZERO:
		animation.play("walk")
	else:
		animation.seek(0,true)
		animation.stop()
	
	if (v.length() < max_speed):
		v += inpv
	
	v = v.move_toward(Vector2.ZERO,fric)
	v = move_and_slide(v)
	
	
	var shoot_dir = Vector2.ZERO
	shoot_dir.x = Input.get_action_strength("shoot_right")- Input.get_action_strength("shoot_left")
	shoot_dir.y = Input.get_action_strength("shoot_down")- Input.get_action_strength("shoot_up")
	
	if (shoot_dir != Vector2.ZERO) and cooldown_timer>cooldown:
		cooldown_timer=0
		
		var bullets=0
		bullets+=rand_range(0,bullets_chance)
		
		var i = -0.5
		while i <= 0.5:
			#print(i)
			var b = Bullet.instance()
			var real_dir = shoot_dir
			if bullets >=1:
				real_dir = shoot_dir.rotated(i)
			b.v=real_dir*3
			b.hp=penetration
			b.damage=damage
			owner.add_child(b)
			b.transform=transform
			b.position+=real_dir*10
			i+=1/bullets
		
		
		
		
		
	
	


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		hp-=1
		$SfxrStreamPlayer.play()
		body.queue_free()
		if hp==0:
			speed = 0
			var go = load("res://game_over.tscn")
			go = go.instance()
			add_child(go)
	pass # Replace with function body.
