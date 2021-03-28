extends base_ability
class_name test_passive

# Declare member variables here. Examples:
# var a = 2
#var id = "passive0"

#executed when the ability is equipped in passive slot
func passive_equip(owner):
	owner.passive=id
	
#executed by character every update
func passive_process(owner):	
	if owner.hp[0]<owner.hp[1]:
		owner.hp[0]+=get_level(owner)
		print("doing a passive process ",owner.hp[0])

