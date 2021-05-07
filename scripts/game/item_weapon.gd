extends base_item
class_name item_weapon

# Test weapon

@export var damage:Array=[0,0,0,0]
@export var range:float=1.0

func test():
	print(id)
	
func equip(owner):
	print("Equipping")
	var attach=owner.find_node("weapon")	
	#item_mesh.set_surface_material(0,t.get_active_material(0))
	attach.add_child(mesh.instance())
	
func use(owner, target):	
	var base:float = damage[base_item.DMG_NORMAL]
	#print("Base damage ",base)
	var at_bonus=owner.get_attrib(character.STR)/10.0
	#print("Attrib bonus ", at_bonus)
	base = base+base*at_bonus
	print("Total damage ",base)
	if owner.passive== "wpn_master":		
		var l:float=owner.get_ability_level("wpn_master")/10.0
		#print("wpn_master active!! Bonus ",l)
		base=base+base*l
	#now get target armor
	var prot = target.get_protection(base_item.DMG_NORMAL)  
	print("Defense ",prot)
	base-=prot
	target.hp[0]-=base
	print(target.hp[0],"/",target.hp[1]," - ",base)
	if target.hp[0]<=0:	#is dead
		target=null
		if owner is player_character:
			print("Killed by player")
			owner.xp+=5
