extends CanvasLayer

var s

# Called when the node enters the scene tree for the first time.
func _ready():	
	
	#print("Usable size", xx.size.x, xx.size.y)
	s = DisplayServer.window_get_size()
	_adjust_ui()
	refresh_ab_icons()
	
func _adjust_ui():	
	#adjust joystick location&scale
	var scale_x = 14.98 *s.x /100 /128
	var scale_y = 26.66*s.y /100 / 128
	$UI/Joystick.position.x = s.x * 0.05
	$UI/Joystick.position.y = s.y - (s.y*0.15)
	$UI/Joystick.scale.x = scale_x
	$UI/Joystick.scale.y = scale_y
	
	#inventory and skills buttons 
	scale_x = 7.49*s.x/100 / 96
	scale_y = 13.3 *s.y/100 /96
	$UI/spell_book.position.x = s.x * 0.12
	$UI/spell_book.position.y = s.y - (s.y*0.17)
	$UI/spell_book.scale.x = scale_x
	$UI/spell_book.scale.y = scale_y
	
	$UI/invent.position.x = s.x * 0.17
	$UI/invent.position.y = s.y  - (s.y*0.17)
	$UI/invent.scale.x = scale_x
	$UI/invent.scale.y = scale_y
	
	#adjust attack button	
	scale_x = 7.49*s.x/100 / 64
	scale_y = 13.3 *s.y/100 /64
	$UI/attack.position.x = s.x - (scale_x*64 + s.x*0.02)
	$UI/attack.position.y = s.y - (scale_y*64 + s.y*0.02)	
	$UI/attack.scale.x = scale_x
	$UI/attack.scale.y = scale_y
	
	#abilities buttons 	var positions = {1:[1.3,1.2],2:[1.28,1.38],3:[1.19,1.74],4:[1.09,1.78]}
	var positions = {0:[1.31,1.18],1:[1.28,1.38],2:[1.20,1.58],3:[1.09,1.78]}
	for i in range(4):
		var b_name =  "action"+str(i)
		print(b_name)
		var b:TouchScreenButton = get_node("UI/"+b_name)
		b.scale.x =scale_x
		b.scale.y =scale_y
		b.position.x = s.x / positions[i][0] #1.3
		b.position.y = s.y / positions[i][1] - s.y*0.06
	

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
	#$VBoxContainer/str.text= str(game_instance.player.get_player().get_attrib(character.STR))
	var hp = game_instance.player.get_player().hp[0]/100*game_instance.player.get_player().hp[1]
	$UI/stats/hp.value=hp
	#$VBoxContainer/hp.text=hp
	$UI/fps.text= str(Engine.get_frames_per_second())

func update_lights(number:int):
	pass
	#$Label.text="Lights "+str(game_instance.player.get_player().lights)

func get_joystick():
	return $UI/Joystick/TouchScreenButton

func refresh_ab_icons():
	for i in range(4):
		var action_button = "action"+str(i)
		print(action_button)
		if game_instance.player.get_player().equip_abilities[i]!="":
			get_node("UI/"+action_button).normal=game_data.get_ability(game_instance.player.get_player().equip_abilities[i]).icon
	
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
		

func _on_spell_book_pressed():
	$UI.visible = false
	var skill_set = load("res://ui/skill_sheet.tscn").instance()
	get_parent().add_child(skill_set)


func _on_invent_pressed():
	$UI.visible = false
	var inv = load("res://ui/inventory.tscn").instance()
	get_parent().add_child(inv)


func _on_action_pressed(action):
	var ability =game_instance.player.get_player().equip_abilities[action]
	if ability!="": #todo: check if action queue is empty
		var a = {"type":"ability","id":ability,"cooldown":game_data.get_ability(ability).cooldown,"counter":0.0,
		"owner":game_instance.player.get_player(),"target":game_instance.player.get_player().target}
		game_instance.player.get_player().actions.append(a)
	#print(game_instance.player.get_player().equip_abilities[action])
	

#restore the basic ui visibility
func restore_ui():
	$UI.visible = true
