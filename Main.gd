extends Node
var exes = 0
var ohs = 0
#var turn = 0
var player = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.



remote func update(state, text):
#	p.m(state)
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
func checker():
	for x in range(1,10):
		var currentbutton = "Buttons/Button"+str(x)
		if get_node(currentbutton).text == "X":
			exes +=1
		elif get_node(currentbutton).text == "O":
			ohs +=1
	p.m(exes)
	p.m(ohs)
		

func _on_Button_pressed(state):
	checker()
	if player == 0 and ( exes == ohs):
		Globals.a="X"
		var currentbutton = "Buttons/Button"+str(state)
		get_node(currentbutton).text = Globals.a
		rpc("update",state,Globals.a)
	elif player == 0 and exes != ohs:
		pass
	elif player == 1 and ( ohs < exes):
		p.m(( ohs < exes))
		Globals.a="O"
		var currentbutton = "Buttons/Button"+str(state)
		get_node(currentbutton).text = Globals.a
		rpc("update",state,Globals.a)
	exes = 0
	ohs = 0
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
	$Refresh.visible = false
	$Host.visible = false
	$Join.visible = false
	pass # Replace with function body.

remote func refresh():
	for x in range(1,10):
		var currentbutton = "Buttons/Button"+str(x)
		get_node(currentbutton).text = "_"
	checker()
	exes = 0
	ohs = 0

func _on_Refresh_pressed():
	rpc("refresh")
	for x in range(1,10):
		var currentbutton = "Buttons/Button"+str(x)
		get_node(currentbutton).text = "_"
	checker()
	exes = 0
	ohs = 0
#	for x in range(1,10):
#		var currentbutton = "Buttons/Button"+str(x)
#		get_node(currentbutton).text = Globals.a
	pass # Replace with function body.
