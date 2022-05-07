extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func host():
	var peer = NetworkedMultiplayerENet.new()

	peer.create_server(8070)

	get_tree().set_network_peer(peer)
func join():
	var peer = NetworkedMultiplayerENet.new()

	peer.create_client("127.0.0.1", 8070)

	get_tree().set_network_peer(peer)



# Called when the node enters the scene tree for the first time.
func _ready():





	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
