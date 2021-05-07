extends item_weapon
class_name bonus_sword


func equip(owner):
	var power = { "type":base_ability.ATTR,"attribute":character.STR ,"value":3,"duration":-1}
	owner.bonus.append(power)
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
