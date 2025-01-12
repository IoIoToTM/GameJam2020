extends KinematicBody2D


var motion = Vector2()




func _physics_process(delta):
	motion.y+=10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 1000
	elif Input.is_action_pressed("ui_left"):
		motion.x = -1000
	else:
		motion.x = 0
	move_and_slide(motion)
	#print(position)
	
	
	#OS.set_window_position(Vector2(0,0))
	
	

func _ready():
	#OS.set_window_size(Vector2(600,400))
	print()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
