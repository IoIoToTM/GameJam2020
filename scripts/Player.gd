class_name Player
extends Actor


const FLOOR_DETECT_DISTANCE = 20.0

export(String) var action_suffix = ""

onready var platform_detector = $PlatformDetector
onready var sprite = $Sprite
onready var animation_player = $Sprite/AnimationPlayer
onready var animation_player_story = $AnimationPlayer
onready var text = get_node("TextScroll/Control")

onready var camera = get_node("../Camera2D")
onready var cameraPlayer = $Camera2D2


var firstPartOfGame = true

func removeText():
	yield(get_tree().create_timer(1.0), "timeout")
	
	if text.getText()._state == 0:
		print("test")
		disableVisibleText()

func _ready():

	text.visible = false
	#animation_player_story.current_animation = "beginning"
	animation_player_story.play("beginning")
	get_node("TextScroll/Control/Panel/Text").connect("buff_end",self,"removeText")
	
	pass
	# Static types are necessary here to avoid warnings.
	#var camera: Camera2D = $Camera
	#if action_suffix == "_p1":
#		camera.custom_viewport = $"../.."#
#	elif action_suffix == "_p2":
#		var viewport: Viewport = $"../../../../ViewportContainer2/Viewport"
#		viewport.world_2d = ($"../.." as Viewport).world_2d
#		camera.custom_viewport = viewport


# Physics process is a built-in loop in Godot.
# If you define _physics_process on a node, Godot will call it every frame.

# We use separate functions to calculate the direction and velocity to make this one easier to read.
# At a glance, you can see that the physics process loop:
# 1. Calculates the move direction.
# 2. Calculates the move velocity.
# 3. Moves the character.
# 4. Updates the sprite direction.
# 5. Shoots bullets.
# 6. Updates the animation.

var animating = false


func swapCamera():
	
	#camera.position = cameraPlayer.position
	#cameraPlayer.set_anchor_mode(Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT)
	
	camera.set_vector_to_follow(cameraPlayer.get_parent().position)
	print(camera.vectorToFollow)
	camera.current = true
	camera.set_anchor_mode(Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT)


func setWindowFullscreen(fullscreen):
	OS.window_maximized=fullscreen

func setAnimating(isItAnimating):
	animating = isItAnimating

func moveAction(moveString):
	var ev = InputEventAction.new()
# set as move_left, pressed
	ev.action = moveString
	ev.pressed = true
# feedback
	Input.parse_input_event(ev)
	
func playAnimation(animationName,loop):
	
	animation_player.play(animationName)
	animation_player.get_animation(animationName).set_loop(loop)
	animating = true

func testMove():
	var ev = InputEventAction.new()
# set as move_left, pressed
	ev.action = "ui_right"
	ev.pressed = true
# feedback
	Input.parse_input_event(ev)
	
	
	
var firstMove = false
	


func disableVisibleText():
	text.visible = false
	
func enableVisibleText():
	text.visible = true
	
var lazer = false
func lazerHurt():
	if lazer == true:
		return
	lazer = true
	text.visible = true
	get_node("TextScroll/Control/Panel").margin_top = 50
	text.getText().reset()
	text.getText().FONT.set_size(35)
	text.getText().buff_text("OWWWWWW that hurt\n",0.1)
	text.getText().buff_silence(2)
	text.getText().set_state(text.getText().STATE_OUTPUT)

func fallDialog():
	text.visible = true
	get_node("TextScroll/Control/Panel").margin_top = 30
	text.getText().reset()
	text.getText().FONT.set_size(29)
	text.getText().buff_text("That felt very weird",0.1)
	text.getText().buff_silence(0.5)
	text.getText().set_state(text.getText().STATE_OUTPUT)

func writeText(part):
	
	
	#var anim = animation_player_story.get_animation("beginning")
	#anim.remove_track(0)
	if part == 1:
		text.visible = true
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().set_color(Color(20,20,20))
		text.getText().buff_text("Finally, I’m almost at the oracle.\n",0.05)
		text.getText().buff_silence(0.3)
		text.getText().buff_text("I think I can see something.",0.08)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 2:
		text.visible = true
		text.getText().reset()
		text.getText().set_color(Color(20,20,20))
		text.getText().buff_text("Hmmmmmm. Interesting.\n",0.05)
		text.getText().buff_silence(0.4)
		text.getText().buff_text("\"If you want to get to the oracle, alone you won't make it. Only together can you get there.\"....\n",0.05)
		text.getText().buff_silence(1)
		text.getText().buff_text("What does that mean. \nWhy would I need somebody else?",0.05)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 4:
		text.visible = true
		text.getText().reset()
		text.getText().set_color(Color(20,20,20))
		text.getText().buff_text("What's this strange writing?\n",0.05)
		text.getText().buff_silence(1)
		text.getText().buff_text("\"I vocare te ludio, ludius est mihi opus hora mea\"\n",0.08)
		
		
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 3:
		text.visible = true
		text.getText().reset()
		text.getText().set_color(Color(20,20,20))
		text.getText().buff_text("Aley hop\n",0.05)
		text.getText().buff_silence(0.4)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 5:
		text.visible = true
		text.getText().reset()
		text.getText().set_color(Color(20,20,20))
		text.getText().buff_text("WHAT'S HAPPENING\n",0.02)
		text.getText().buff_silence(0.3)
		text.getText().buff_text("WHY IS THE WORLD SHAKING\n",0.02)
		text.getText().buff_silence(0.3)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 6:
		text.visible = true
		text.getText().reset()
		text.getText().set_color(Color(20,20,20))
		text.getText().FONT.set_size(24)
		text.getText().buff_text("\"spell for summoning gods of play \"\n\n",0.035)
		text.getText().buff_silence(0.2)
		text.getText().set_state(text.getText().STATE_OUTPUT)
		
	elif part == 7:
		text.visible = true
		text.getText().reset()
		text.getText().FONT.set_size(35)
		text.getText().buff_text(".........\n",0.05)
		text.getText().buff_silence(0.5)
		text.getText().buff_text("wait WHAT\n",0.02)
		text.getText().buff_silence(0.3)
		text.getText().buff_text("Oh my god why is the world shrinking?!?!?!\n",0.02)
		text.getText().buff_silence(0.3)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 8:
		text.visible = true
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().buff_text("\"The god of this world, the player, will control you using the arrow keys\"\n",0.05)
		text.getText().buff_silence(0.5)
		text.getText().buff_text("What does that mean... WAIT, A PLAYER?!?!\n",0.1)
		text.getText().buff_silence(0.2)
		text.getText().buff_text("AM I IN A GAME?\n",0.12)
		text.getText().buff_silence(0.3)
		text.getText().set_state(text.getText().STATE_OUTPUT)
		
		firstPartOfGame = false
	elif part == 9:
		text.visible = true
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().buff_text("OWWW this feels weird, what's controlling me\n",0.05)
		text.getText().buff_silence(0.5)
		text.getText().buff_text("Player? God? Who are you? Please be careful\n",0.1)
		text.getText().buff_silence(0.2)
		text.getText().buff_text(".....I'm scared but I trust that we can do this together\n",0.07)
		text.getText().buff_silence(0.3)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 10 and jumpBool == false:
		text.visible = true
		text.getText().reset()
		jumpBool = true
		
		get_node("TextScroll/Control/Panel").margin_top = 64
		
		text.getText().FONT.set_size(29)
		text.getText().buff_text("Ugh such a big jump\n",0.05)
		text.getText().buff_silence(0.5)
		text.getText().buff_text("Can we make it?\n",0.05)
		text.getText().buff_silence(0.2)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 11 and jumpBool == true:
		text.visible = true
		jumpBool = false
		get_node("TextScroll/Control/Panel").margin_top = -20
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().buff_text("..................\n",0.1)
		text.getText().buff_silence(1)
		text.getText().buff_text("It's dark here..... The sign says \"The player can move the window around\"......\n",0.05)
		text.getText().buff_silence(0.2)
		text.getText().buff_text("Don't ask me how I managed to read it\n",0.05)
		text.getText().buff_silence(3)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 12 and jumpBool == false:
		text.visible = true
		jumpBool = true
		
		temporaryPlayerPos = self.position
		
		get_node("TextScroll/Control/Panel").margin_top = 30
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().buff_text("WHAT IS HAPPENING WITH THE WORLD\n\n",0.1)
		text.getText().buff_silence(1)
		text.getText().buff_text("It's being destoyed \n",0.05)
		text.getText().buff_silence(0.2)
		text.getText().buff_text("I have to fix this... No, WE have to fix it, with the help of the oracle\n",0.05)
		text.getText().buff_silence(3)
		text.getText().set_state(text.getText().STATE_OUTPUT)
		
		setAnimating(true)
	
		animation_player.play("idleFront")
		yield(get_tree().create_timer(11.0), "timeout")
		setAnimating(false)
		temporaryPlayerPos = null
		
	elif part == 13 and jumpBool == true:
		text.visible = true
		jumpBool = false
		temporaryPlayerPos = self.position
		get_node("TextScroll/Control/Panel").margin_top = 30
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().buff_text("This is so surreal\n\n",0.1)
		text.getText().buff_silence(0.5)
		text.getText().buff_text("...\n",0.7)
		text.getText().buff_silence(0.2)
		text.getText().buff_text("What even is THAT??\n",0.05)
		text.getText().buff_silence(3)
		text.getText().set_state(text.getText().STATE_OUTPUT)
		
		setAnimating(true)
	
		animation_player.play("idleBack")
		yield(get_tree().create_timer(8.0), "timeout")
		setAnimating(false)
		temporaryPlayerPos = null

	elif part == 16 and jumpBool == false:
		text.visible = true
		jumpBool = true
		get_node("TextScroll/Control/Panel").margin_top = 20
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().buff_text("LASERS?!\n",0.1)
		text.getText().buff_silence(1)
		text.getText().buff_text("AT THIS TIME OF DAY?\n",0.1)
		text.getText().buff_silence(1)
		text.getText().buff_text("We have to find a way to stop them so I can pass\n",0.04)
		text.getText().set_state(text.getText().STATE_OUTPUT)
		
	elif part == 17 and jumpBool == true:
		text.visible = true
		jumpBool = false
		get_node("TextScroll/Control/Panel").margin_top = 50
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().buff_text("We're a pretty good team, how about that\n",0.1)
		text.getText().buff_silence(2)
		text.getText().set_state(text.getText().STATE_OUTPUT)
	elif part == 18 and jumpBool == false:
		text.visible = true
		jumpBool = true
		get_node("TextScroll/Control/Panel").margin_top = 10
		text.getText().reset()
		text.getText().FONT.set_size(29)
		text.getText().buff_text("This must be the oracle's cave!\n",0.06)
		text.getText().buff_silence(1)
		text.getText().buff_text("We're getting closer, he should be able to help us\n",0.06)
		text.getText().buff_silence(2)
		text.getText().buff_text("I have a bad feeling.....\n",0.08)
		text.getText().set_state(text.getText().STATE_OUTPUT)
		
		
# Splitting the physics process logic into functions not only makes it
# easier to read, it help to change or improve the code later on:
# - If you need to change a calculation, you can use Go To -> Function
#   (Ctrl Alt F) to quickly jump to the corresponding function.
# - If you split the character into a state machine or more advanced pattern,
#   you can easily move individual functions.

func ending():
	text.visible = true
	get_node("TextScroll/Control/Panel").margin_top = 10
	text.getText().reset()
	text.getText().FONT.set_size(29)
	text.getText().buff_text("The orcale......\n",0.12)
	text.getText().buff_silence(1)
	text.getText().buff_text("is..... dead......\n",0.12)
	text.getText().buff_silence(1)
	text.getText().buff_text("No....NO.... What are we going to do now???\n",0.08)
	text.getText().set_state(text.getText().STATE_OUTPUT)
	
	yield(get_tree().create_timer(11), "timeout")
	get_tree().change_scene("res://old/EndScreen.tscn")

var jumpBool = false
var temporaryPlayerPos = null

var playedTimes = 0

func audioPlayer():
	pass

func _physics_process(_delta):
	
	audioPlayer()
	
	
	
	
	
	var x = get_position().x
	var y = get_position().y
	
	
	
	var newVector = Vector2(x-text.rect_size.x/2,y-250)
	
	text.rect_position = newVector
	
	
	var direction = get_direction()


	
	#camera.vectorToFollow = 
	
	
	if animating == false and firstMove == false and !firstPartOfGame:
		if Input.is_action_just_pressed("ui_left") or  Input.is_action_just_pressed("ui_right") or  Input.is_action_just_pressed("ui_up"):
			writeText(9)
			firstMove = true
	
	#if text.getText().buff_end():
	#	print ("help")
	

	var is_jump_interrupted = Input.is_action_just_released("jump" + action_suffix) and _velocity.y < 0.0
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	
	

	var snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE if direction.y == 0.0 else Vector2.ZERO
	var is_on_platform = platform_detector.is_colliding()
	_velocity = move_and_slide_with_snap(
		_velocity, snap_vector, FLOOR_NORMAL, not is_on_platform, 4, 0.9, false
	)

	# When the character’s direction changes, we want to to scale the Sprite accordingly to flip it.
	# This will make Robi face left or right depending on the direction you move.
	if direction.x != 0:
		sprite.scale.x = 1 if direction.x > 0 else -1

	var animation = get_new_animation()
	
	#print(is_on_floor())
	
#	if Input.is_action_just_pressed("ui_up"):
#	#	print("help")
#		animation = "jumpUp"
#		if animation != animation_player.current_animation:
#			animation_player.play(animation)
	if temporaryPlayerPos != null:
		self.position = temporaryPlayerPos
	
	if animating:
		return
	if animation != animation_player.current_animation and animation_player.current_animation != "land":
		animation_player.play(animation)
	# We use the sprite's scale to store Robi’s look direction which allows us to shoot
	# bullets forward.
	# There are many situations like these where you can reuse existing properties instead of
	# creating new variables.
	
	

	


func get_direction():
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		-1 if is_on_floor() and Input.is_action_just_pressed("ui_up") else 0
	)


# This function calculates a new velocity whenever you need it.
# It allows you to interrupt jumps.
func calculate_move_velocity(
		linear_velocity,
		direction,
		speed,
		is_jump_interrupted
	):
	var velocity = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
	return velocity


func get_new_animation():
	var animation_new = ""
	#print(abs(_velocity.x))
	if is_on_floor():
		if animation_player.current_animation == "jumpDown":
			animation_new = "land"
		else:
			animation_new = "run" if abs(_velocity.x) > 0.1 else "idleSide"
	elif Input.is_action_just_pressed("ui_up"):
		animation_new = "jumpUp"
		
	elif _velocity.y > 0 :
		animation_new = "jumpDown"
		#print (animation_player.current_animation)
	return animation_new


func _on_Area2D_body_entered(body):
	disableVisibleText()
	writeText(10)
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	yield(get_tree().create_timer(2.0), "timeout")
	writeText(11)
	pass # Replace with function body.


func _on_Area2D3_body_entered(body):
	writeText(12)
	pass # Replace with function body.




func _on_Area2D4_body_entered(body):
	yield(get_tree().create_timer(0.2), "timeout")
	writeText(13)
	
	
	
	
	pass # Replace with function body.


func _on_Fall1st_body_entered(body):
	if body == self:
		self.position =get_node("../Fall1st").position+ get_node("../Fall1st/respwanPoint").position
		writeText(14)
	pass # Replace with function body.


func _on_Area2D5_body_entered(body):
	writeText(16)
	pass # Replace with function body.


func _on_Area2D6_body_entered(body):
	writeText(17)
	pass # Replace with function body.


func _on_Area2D7_body_entered(body):
	if body == self:
		writeText(18)
	pass # Replace with function body.


func _on_Area2D8_body_entered(body):
	ending()
	pass # Replace with function body.




func _on_AudioStreamPlayer2D2_finished():
	audioPlayer()
	pass # Replace with function body.
