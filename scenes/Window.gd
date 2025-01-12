extends Node

var _duration = 0.0
var _period_in_ms = 0.0
var _amplitude = 0.0
var _timer = 0.0
var _last_shook_timer = 0
var _previous_x = 0.0
var _previous_y = 0.0
var _last_offset = Vector2(0, 0)

var maxX = 1300
var maxY = 900

var windowIsGettingSmaller = false
var afterResizeEvent = false


func setWindowSmaller(start):
	windowIsGettingSmaller = start
#https://godotengine.org/qa/8841/is-there-way-to-set-the-minimum-dimensions-of-the-game-window
func resize():
	
	if afterResizeEvent == true:
		var currentSize = OS.get_window_size()

		if currentSize.x > maxX :
			OS.set_window_size(Vector2(maxX, currentSize.y))

		if(currentSize.y > maxY):
			OS.set_window_size(Vector2(currentSize.x, maxY))

func _ready():
	set_process(true)
	get_node("/root").connect("size_changed", self, "resize")

var number = 0

var factor = 3

func _physics_process(delta):
	number = number + 1
	if number == 5:
		number = 0
		if windowIsGettingSmaller:
			
			var width = OS.get_window_size().x -2*factor
			
			var xPos = OS.get_window_position().x+1*factor
			
			if width < 1024:
				width = 1024
				xPos-=1*factor
			
			
			var heigth = OS.get_window_size().y -2*factor
			var yPos = OS.get_window_position().y+1*factor
			
			if heigth < 600:
				heigth = 600
				yPos-=1*factor
				
			if width == 1024 and heigth == 600:
				windowIsGettingSmaller = false
				OS.window_resizable = true
				afterResizeEvent = true
			
			OS.set_window_size(Vector2(width,heigth))
			OS.set_window_position(Vector2(xPos,yPos))
		

# Shake with decreasing intensity while there's time remaining.
func _process(delta):
	# Only shake when there's shake time remaining.
	var windowPos = OS.get_window_position()
	var player = get_node("../Player").position
	var newPos = 150
	if windowPos.y > player.y-96-164:
		print("window y = " + str(windowPos.y) + "  playerPos y = " +str(player.y-96-164))
		windowPos = Vector2(windowPos.x,player.y-96-164)#+ vectorToFollow - vectorToAddTOfixCamera
	
		OS.set_window_position(windowPos)
		var vectorTemp = Vector2(player.x-(1920/2),newPos)
	
	
	
	
	if _timer == 0:
		return
	# Only shake on certain frames.
	_last_shook_timer = _last_shook_timer + delta
	# Be mathematically correct in the face of lag; usually only happens once.
	while _last_shook_timer >= _period_in_ms:
		_last_shook_timer = _last_shook_timer - _period_in_ms
		# Lerp between [amplitude] and 0.0 intensity based on remaining shake time.
		var intensity = _amplitude * (1 - ((_duration - _timer) / _duration))
		# Noise calculation logic from http://jonny.morrill.me/blog/view/14
		var new_x = rand_range(-1.0, 1.0)
		var x_component = intensity * (_previous_x + (delta * (new_x - _previous_x)))
		var new_y = rand_range(-1.0, 1.0)
		var y_component = intensity * (_previous_y + (delta * (new_y - _previous_y)))
		_previous_x = new_x
		_previous_y = new_y
		# Track how much we've moved the offset, as opposed to other effects.
		var new_offset = Vector2(x_component, y_component)
		
		OS.set_window_position(OS.get_window_position() - _last_offset + new_offset)
		#OS.set_window_size(OS.get_window_size() - _last_offset + new_offset)
		#OS.get_window_position()
		 #set_offset(get_offset() - _last_offset + new_offset)
		_last_offset = new_offset
	# Reset the offset when we're done shaking.
	_timer = _timer - delta
	if _timer <= 0:
		_timer = 0
		OS.set_window_position(OS.get_window_position() - _last_offset)

# Kick off a new screenshake effect.
func shake(duration, frequency, amplitude):
	# Initialize variables.
	_duration = duration
	_timer = duration
	_period_in_ms = 1.0 / frequency
	_amplitude = amplitude
	_previous_x = rand_range(-1.0, 1.0)
	_previous_y = rand_range(-1.0, 1.0)
	# Reset previous offset, if any.
	OS.set_window_position(OS.get_window_position() - _last_offset )
	_last_offset = Vector2(0, 0)



