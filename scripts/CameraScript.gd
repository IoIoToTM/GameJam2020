extends Camera2D

onready var camera = get_node(".")

var vectorToFollow 

func set_vector_to_follow(vector):
	vectorToFollow = vector

func setCameraToFollowWindow():
	var windowPos = OS.get_window_position()
	var size = OS.get_window_size()
	
	var vectorToAddTOfixCamera = Vector2(size.x/2,size.y/2)
	
	var player = get_node("../Player").position
	
	
	var newPos = 150
	
	
	
	if windowPos.y > player.y-96-164:
		print("window y = " + str(windowPos.y) + "  playerPos y = " +str(player.y-96-164))
		
	var vectorTemp = Vector2(player.x-(1920/2),newPos)
	
	windowPos = windowPos + Vector2(8,31) +  vectorTemp#+ vectorToFollow - vectorToAddTOfixCamera
	#print(vectorToFollow)
	camera.position = windowPos
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	#pass
	setCameraToFollowWindow()




# Called when the node enters the scene tree for the first time.
func _ready():
	vectorToFollow = Vector2(0,0)
#	camera.limit_left = -(OS.window_size.x/2)
#	camera.limit_top = -(OS.window_size.y/2)
#	var sizeMonitor = OS.get_screen_size()
#	camera.limit_right =sizeMonitor.x+(OS.window_size.x/2)
#	camera.limit_bottom = sizeMonitor.y+(OS.window_size.y/2)
#	pass # Replace with function body.

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
