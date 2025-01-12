extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var text = get_node("Panel/Text")

var testing = true

func getText():
	return text

func _process(delta):
	if testing == false:
		text.reset()
		text.set_color(Color(20,20,20))
		
		text.buff_text("testing ;lalalal",0.2)
		testing = true
		text.set_state(text.STATE_OUTPUT)
		print("WTF")


# Called when the node enters the scene tree for the first time.
func _ready():
	#text.reset()
	#text.set_color(Color(20,20,20))
	#text.buff_text("testing ;lalalal",0.2)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
