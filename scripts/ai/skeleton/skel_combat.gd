extends ai_logic
class_name skel_combat

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func do_logic(manager):
	if manager.parent.equipped[base_item.SLOT_WEAPON]=="":
		#equip  something
		manager.parent.equipped[base_item.SLOT_WEAPON]=manager.parent.inventory[0].get("id")
		game_data.get_item(manager.parent.equipped[base_item.SLOT_WEAPON]).equip(manager.parent)
		
	if manager.parent.target.translation.distance_to(manager.parent.translation)>2:
		print("Too far")	
		manager.parent.move_to(manager.parent.target.translation)
	else:
		if manager.parent.actions.size()>0:
			#just do nothing, already something in the action queue
			return
		else :
			if manager.parent.target==null:
				return
			#we can do something
			print("Attacking...")
			var it_name = manager.parent.equipped[base_item.SLOT_WEAPON]
			var a = {"type":"item","id":it_name,"cooldown":game_data.get_item(it_name).UseTime,"counter":0.0,
			"owner":manager.parent,"target":manager.parent.target}
			manager.parent.actions.append(a)
	
