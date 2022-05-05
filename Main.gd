extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed(state):
	var currentbutton = "Buttons/Button"+str(state)
	
	get_node(currentbutton).text = Globals.a
	if Globals.a=="X":
		print("1")
		Globals.a="O"
	elif Globals.a=="O":
		Globals.a="X"
	
	pass # Replace with function body.
