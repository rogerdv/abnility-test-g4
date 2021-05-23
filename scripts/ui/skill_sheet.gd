extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = load("res://ui/slot_button.tscn")
	for i in game_instance.player.get_player().abilities.size():
		#print(i)
		var cont = VBoxContainer.new()
		var temp = button.instance()
		temp.name = game_instance.player.get_player().abilities[i].get("id")
		temp.get_child(0).texture = game_data.get_ability(game_instance.player.get_player().abilities[i].get("id")).icon
		temp.get_child(1).text = str(game_instance.player.get_player().abilities[i].get("level"))
		cont.add_child(temp)
		var id_label = Label.new() 
		id_label.text = game_instance.player.get_player().abilities[i].get("id")
		cont.add_child(id_label)
		$MarginContainer/PanelContainer/HBoxContainer/Abilities.add_child(cont)
		#$UI.add_button(game_instance.player.get_player().abilities[i].get("id"),i)
	#now place the equipped abilities
	for i in range(4):
		var action_button = "active"+str(i)		
		if game_instance.player.get_player().equip_abilities[i]!="":
			get_node("MarginContainer/PanelContainer/HBoxContainer/EquipAbilities/actives/"+action_button+"/icon").texture=game_data.get_ability(game_instance.player.get_player().equip_abilities[i]).icon


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_accept_pressed():
	get_parent().get_node("UI").restore_ui()
	get_parent().get_node("UI").refresh_ab_icons()
	queue_free()
