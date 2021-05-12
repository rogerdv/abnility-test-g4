extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_button(name:String, id:int):
	var b = Button.new()
	b.text = name
	$VBoxContainer.add_child(b)
	b.connect("pressed", button_pressed, [id])

func add_item_button(name:String, id:int):
	var container = HBoxContainer.new()
	var icon=TextureRect.new()
	icon.texture = game_data.get_item(name).icon
	container.add_child(icon)
	var lab=Label.new()  
	lab.text=name
	container.add_child(lab)
	var equip_b = Button.new()
	equip_b.text="Equip"
	equip_b.connect("pressed", add_equipped_button, [name,id])	
	container.add_child(equip_b)
	$Inventory.add_child(container)
	

#adds a button when the item is equipped
func add_equipped_button(name:String,id:int):
	var container = HBoxContainer.new()
	var lab=Label.new()  
	lab.text=name
	container.add_child(lab)
	var b = Button.new()
	b.text = "Use"
	container.add_child(b)
	$Equipped.add_child(container)
	b.connect("pressed", item_use, [base_item.SLOT_WEAPON])	
	if game_data.get_item(game_instance.player.get_player().inventory[id].get("id")).type==base_item.IT_WEAPON:
		#its a weapon
		game_instance.player.get_player().equipped[base_item.SLOT_WEAPON]=name
	game_data.get_item(game_instance.player.get_player().inventory[id].get("id")).equip(game_instance.player.get_player())
	
# Uses an ability from the list
func button_pressed(id):
	#print(id)	
	var ab_id=game_instance.player.get_player().abilities[id].get("id") #.get("ability")
	
	if game_data.get_ability(ab_id).type==base_ability.PASSIVE: #passive ability
		if game_instance.player.get_player().passive!=game_instance.player.get_player().abilities[id].get("id"):
			game_data.get_ability(ab_id).passive_equip(game_instance.player.get_player())
		else:
			game_instance.player.get_player().passive=""	#unequip passive ability
	else : 	#its an active ability		
		var a = {"type":"ability","id":ab_id,"cooldown":game_instance.get_ability(ab_id).cooldown,"counter":0.0,
		"owner":game_instance.player.get_player(),"target":game_instance.player.get_player().target}
		game_instance.player.get_player().actions.append(a)
		#game_data.get_ability(ab_id).execute(game_instance.player.get_player(), game_instance.player.get_player().target)

func item_use(slot):
	#game_instance.player.inventory[id].get("item").use(game_instance.player, game_instance.player)
	print("Goin to use ",slot)
	var it_name = game_instance.player.get_player().equipped[slot]
	print("Goin to use:name ",it_name)
	for i in range(game_instance.player.get_player().inventory.size()):
		if game_instance.player.get_player().inventory[i].get("id")==it_name:
			game_data.get_item(game_instance.player.get_player().inventory[i].get("id")).use(game_instance.player.get_player(), game_instance.player.get_player().target)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$VBoxContainer/str.text= str(game_instance.player.get_player().get_attrib(character.STR))
	var hp = str(game_instance.player.get_player().hp[0])+"/"+str(game_instance.player.get_player().hp[1])
	$VBoxContainer/hp.text=hp
	$fps.text= str(Engine.get_frames_per_second())

func update_lights(number:int):
	$Label.text="Lights "+str(game_instance.player.get_player().lights)

func get_joystick():
	return $Sprite2D/TouchScreenButton


func _on_Attack_pressed():
	if game_instance.player.get_player().actions.size()>0:
		#just do nothing, already something in the action queue
		return
	else :
		if game_instance.player.get_player().target==null:
			return
		var it_name = game_instance.player.get_player().equipped[base_item.SLOT_WEAPON]
		var a = {"type":"item","id":it_name,"cooldown":game_data.get_item(it_name).UseTime,"counter":0.0,
		"owner":game_instance.player.get_player(),"target":game_instance.player.get_player().target}
		game_instance.player.get_player().actions.append(a)
		

