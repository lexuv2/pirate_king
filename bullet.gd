extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal hit_wall
var hp =1
var damage = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var v = Vector2(0,0)





func _physics_process(delta):
	var body = move_and_collide(v)
	if hp <=0:
		queue_free()
	if (body!=null):
		if body.collider.get("name")=="wall_body":
			queue_free()







func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
