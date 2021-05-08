extends base_ability
class_name weapon_mastery


#executed when the ability is equipped in passive slot
func passive_equip(owner):
	owner.passive=id
	
#executed by character every update
func passive_process(owner):	
	pass
