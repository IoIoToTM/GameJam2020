extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var windowPosition


func _physics_process(delta):
	var screenshot = $ScreenshotSprite
	
	
	var player = get_node("Player").position
	
	var vectorTemp = Vector2(player.x-(1920/2)+5,155)
	
	
	screenshot.position =   vectorTemp 
	pass



# Called when the node enters the scene tree for the first time.
func _ready():
	
	OS.window_size = OS.get_screen_size()
	OS.window_maximized = false
	OS.set_window_position ( Vector2(-10,0))
	
	var screenshoter = load("res://old/IntroScreen.gd").new()
	
	var texture = $Screenshot
	
	screenshoter.takeScreenshot(texture)
	
	var screenshotSprite = $ScreenshotSprite
	
	screenshotSprite.texture = texture.texture
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_laserOutFirst_screen_exited():
	get_node("Lasers/first/laser").visible = false
	get_node("Lasers/first/laser/LaserFirstBoundary/CollisionShape2D").disabled = true
	pass # Replace with function body.


func _on_laserOutFirst_screen_entered():
	get_node("Lasers/first/laser").visible = true
	get_node("Lasers/first/laser/LaserFirstBoundary/CollisionShape2D").disabled = false
	pass # Replace with function body.




func _on_LaserFirstBoundary_body_entered(body):
	
	if(body == $Player):
		$Player.lazerHurt()
		body.position = get_node("Lasers").position + get_node("Lasers/respawnPoint").position
	
	
	
	pass # Replace with function body.


func _on_LaserSecondBoundary_body_entered(body):
	if(body == $Player):
		$Player.lazerHurt()
		body.position = get_node("Lasers").position + get_node("Lasers/respawnPoint").position
	pass # Replace with function body.


func _on_laserOutSecond_screen_entered():
	get_node("Lasers/second/laser").visible = true
	get_node("Lasers/second/laserEnd").visible = true
	get_node("Lasers/second/laser/LaserSecondBoundary/CollisionShape2D").disabled = false

	pass # Replace with function body.


func _on_laserOutSecond_screen_exited():
	get_node("Lasers/second/laser").visible = false
	get_node("Lasers/second/laserEnd").visible = false
	get_node("Lasers/second/laser/LaserSecondBoundary/CollisionShape2D").disabled = true
	pass # Replace with function body.


func _on_LaserThirdBoundary_body_entered(body):
	if(body == $Player):
		$Player.lazerHurt()
		body.position = get_node("Lasers").position + get_node("Lasers/respawnPoint").position
	pass # Replace with function body.
	pass # Replace with function body.


func _on_laserOutThird_screen_exited():
	get_node("Lasers/third/laser").visible = false
	get_node("Lasers/third/laserEnd").visible = false
	get_node("Lasers/third/laser/LaserThirdBoundary/CollisionShape2D").disabled = true
	pass # Replace with function body.



func _on_laserOutThird_screen_entered():
	get_node("Lasers/third/laser").visible = true
	get_node("Lasers/third/laserEnd").visible = true
	get_node("Lasers/third/laser/LaserThirdBoundary/CollisionShape2D").disabled = false
	pass # Replace with function body.


func _on_laserOutFourth_screen_exited():
	get_node("Lasers/fourth/laser").visible = false
	get_node("Lasers/fourth/laser/LaserFourthBoundary/CollisionShape2D").disabled = true
	pass # Replace with function body.


func _on_laserOutFourth_screen_entered():
	get_node("Lasers/fourth/laser").visible = true
	get_node("Lasers/fourth/laser/LaserFourthBoundary/CollisionShape2D").disabled = false
	pass # Replace with function body.


func _on_LaserFourthBoundary_body_entered(body):
	if(body == $Player):
		$Player.lazerHurt()
		body.position = get_node("Lasers").position + get_node("Lasers/respawnPoint").position
	pass # Replace with function body.


func _on_laserOutFifth_screen_exited():
	get_node("Lasers/fifth/laser").visible = false
	get_node("Lasers/fifth/laser/LaserSecondBoundary/CollisionShape2D").disabled = true
	pass # Replace with function body.


func _on_laserOutFifth_screen_entered():
	get_node("Lasers/fifth/laser").visible = true
	get_node("Lasers/fifth/laser/LaserSecondBoundary/CollisionShape2D").disabled = false
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if(body == $Player):
		body.position = get_node("Lasers").position + get_node("Lasers/respawnPoint").position
	pass # Replace with function body.
