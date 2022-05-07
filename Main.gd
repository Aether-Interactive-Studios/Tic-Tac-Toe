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
remote func update(state, text):
	var currentbutton = "Buttons/Button"+str(state)
	get_node(currentbutton).text = text
	if Globals.a=="X":
		print("1")
		Globals.a="O"
	elif Globals.a=="O":
		Globals.a="X"


func _on_Button_pressed(state):
	var currentbutton = "Buttons/Button"+str(state)
	
	get_node(currentbutton).text = Globals.a
	rpc("update",state,Globals.a)
	
			
	if Globals.a=="X":
		print("1")
		Globals.a="O"
	elif Globals.a=="O":
		Globals.a="X"
	
	pass # Replace with function body.


func _on_Host_pressed():
	Network.host()
	Globals.player= 0
	$Host.visible = false
	$Join.visible = false
	pass # Replace with function body.


func _on_Join_pressed():
	Network.join()
	Globals.player= 1
	$Host.visible = false
	$Join.visible = false
	pass # Replace with function body.
