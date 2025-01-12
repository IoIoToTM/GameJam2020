extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _physics_process(delta):
	
	
	
	if !$first/laserOutFirst.is_on_screen():
		var temp = OS.window_position.y+ OS.get_real_window_size().y+110
		$first/laserStart.global_position = Vector2($first/laserStart.global_position.x,temp) 
	else:
		$first/laserStart.position = Vector2(0,12)
		
	if !$second/laserOutSecond.is_on_screen():
		var temp = OS.window_position.y+210
		$second/laserStart.global_position = Vector2($second/laserStart.global_position.x,temp) 
		
	else:
		$second/laserStart.position = Vector2(0,12)
	
	if !$third/laserOutThird.is_on_screen():
		var temp = OS.window_position.y+210
		$third/laserStart.global_position = Vector2($third/laserStart.global_position.x,temp) 
		
	else:
		$third/laserStart.position = Vector2(0,12)
		
	if !$fifth/laserOutFifth.is_on_screen():
		var temp = OS.window_position.y+210
		$fifth/laserStart.global_position = Vector2($fifth/laserStart.global_position.x,temp) 
		
	else:
		$fifth/laserStart.position = Vector2(0,12)
		
	if !$fourth/laserOutFourth.is_on_screen():
		var temp = OS.window_position.y+ OS.get_real_window_size().y+110
		$fourth/laserStart.global_position = Vector2($fourth/laserStart.global_position.x,temp) 
	else:
		$fourth/laserStart.position = Vector2(0,12)
	
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
