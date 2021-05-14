extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player = load("res://model/player_rig.tscn").instance()


# Called when the node enters the scene tree for the first time.
func _ready():	
	pass

func fill_player():
	for ab in game_data.abilities.abilities:			
		var t = {"id":ab["id"],"level":2 }
		player.get_player().abilities.append(t)	
	
	for it in game_data.items.items:
		#print(it["id"])	
		var t = {"id":it["id"],"amount":1}
		player.get_player().inventory.append(t)
		
	#t = {"id":"active0","value":{"level":1,"ability":act_ab} }
	#player.abilities.append(t)
	#t = {"id":"move","value":{"level":3,"ability":move_ab} }
	#player.abilities.append(t)
	#t = {"id":"power","value":{"level":3,"ability":power} }
	#player.abilities.append(t)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
