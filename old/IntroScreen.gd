extends Node


onready var animPlayer = get_node("ColorRect/AnimationPlayer")
onready var camera = get_node("Camera2D")


func setCameraToFollowWindow():
	var temp = OS.get_window_position()
	temp = temp + Vector2(8,31)
	camera.position = temp

func _process(delta):
	pass

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func minimizeWindow():
	OS.set_window_minimized(true)
	
	
func unminimizeWindow():
	OS.set_window_minimized(false)
	
func takeScreenshot(texture):
	minimizeWindow()
	var cs_class = preload("res://old/Test.cs")
	var cs_node = cs_class.new()
	cs_node.takeScreenshot(texture)
	
	unminimizeWindow()

# Called when the node enters the scene tree for the first time.
func _ready():
	#takeScreenshot()
	
	#print("playing fade out")
	animPlayer.play("fade_out")
	waitForAnim()
		
	pass # Replace with function body.

func waitForAnim():
	yield(animPlayer,"animation_finished")
	yield(get_tree().create_timer(2),"timeout")
	animPlayer.play("fade_in")
	yield(animPlayer,"animation_finished")
	if self.name == "EndGame":
		get_tree().quit()
	get_tree().change_scene("res://scenes/Test.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
