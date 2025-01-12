extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var motion = Vector2()
#onready var right = get_node("../Player/Right")
#onready var left = get_node("../Player/Left")
#onready var up = get_node("../Player/Up")
#onready var down = get_node("../Player/Down")

var windowSize = Vector2(0,0)

func startWindow():
	OS.window_size = windowSize

# Called when the node enters the scene tree for the first time.
func _ready():
	#OS.window_borderless = true
	#OS.window_resizable = true
	pass # Replace with function body.
	
	

func _process(delta):
	
	if Input.is_action_pressed("ui_down"):
		get_node("../Player/Sprite")
		var image = OS.get_clipboard().get_extension()
		print (image)
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	
#	if windowSize.x == 100:
#		print(Engine.get_frames_per_second())
#		pass
#	else:
#		startWindow()
#		windowSize= windowSize+Vector2.ONE
#		position = OS.window_position
	#print(offset)
	#if Input.is_action_pressed("ui_right"):
#		motion.x = 10
#		#print("right")
#	elif Input.is_action_pressed("ui_left"):
#		motion.x = -10
#	else:
#		motion.x = 0
	##var right = get_node("../Player/Colliders/Right")
	#print (right.is_on_screen())
	#if !right.is_on_screen():
#		print("Is not right on screen")#
#	elif !left.is_on_screen():
#		print("Is not on left screen")
		
	#move_and_slide(motion)
	#position += Vector2(motion.x,0)
	
	#print(get_parent().position)
	#print(position)
	pass



#func _on_Right_screen_exited():#
#	print("wow")
#	pass # Replace with function body.
#
#
#func _on_Right_viewport_exited(viewport):
#	print("wow12")
#	pass # Replace with function body.
