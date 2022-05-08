extends Node

#var turn = 0
var player = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.



remote func update(state, text):
	p.m(state)
	var currentbutton = "Buttons/Button"+str(state)
	get_node(currentbutton).text = text
	pass
#	turner()
#	var currentbutton = "Buttons/Button"+str(state)
#	get_node(currentbutton).text = text
##	p.m(Globals.turn%2)
##	if text == "X":
##		Globals.a = "O"
##	elif text == "O":
##		Globals.a = "X"
#	$Label.visible = true
#	get_node(currentbutton).text = text
#
#func turner():
#	if turn%2 == 0:
#		#p.m(Globals.turn%2)
#		Globals.a = "X"
#	else:
#		Globals.a = "O"
#
#	p.m(Globals.a)

func _on_Button_pressed(state):
	
	if player == 0:
		Globals.a="X"
		var currentbutton = "Buttons/Button"+str(state)
		get_node(currentbutton).text = Globals.a
		rpc("update",state,Globals.a)
	elif player == 1:
		Globals.a="O"
		var currentbutton = "Buttons/Button"+str(state)
		get_node(currentbutton).text = Globals.a
		rpc("update",state,Globals.a)
#	if $Label.visible == false:
#		Globals.a = "O"
#		var currentbutton = "Buttons/Button"+str(state)
#		get_node(currentbutton).text = Globals.a
#		rpc("update",state,Globals.a,turn)
#		$Label.visible = true
#	else:
#		#p.m(turn)
#		Globals.a = "X"
#		var currentbutton = "Buttons/Button"+str(state)
#		get_node(currentbutton).text = Globals.a
#
#		#turner()
#
#		rpc("update",state,Globals.a,turn)
#
#
#		get_node(currentbutton).text = Globals.a
#		turn = turn + 1
#		$Label.visible = false
	#	if Globals.a=="X":
#		print("1")
#		Globals.a="O"
#	elif Globals.a=="O":
#		Globals.a="X"
	
	pass # Replace with function body.


func _on_Host_pressed():
	Network.host()
	#player= 0
	#Globals.a = "O"
	
	$Host.visible = false
	$Join.visible = false
	pass # Replace with function body.


func _on_Join_pressed():
	Network.join()
	player = 1
	$Host.visible = false
	$Join.visible = false
	pass # Replace with function body.
