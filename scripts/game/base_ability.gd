extends Resource
class_name base_ability

var abilities = []

# Declare member variables here. Examples:
var level:int = 0
enum AbilityType {NORMAL=1,PASSIVE =2}
@export var type: int = 1
@export var id:String = "id"

func get_level(owner) ->int:
	var my_lvl = 0
	for a in owner.abilities:
		if a.get("id")==id:
			my_lvl = a.get("value").get("level")
			break
	return my_lvl
	
func execute(caster, target):
	pass

#executed when the ability is equipped in passive slot
func passive_equip(owner):
	pass
	
func passive_unequip(owner):
	pass
	
#executed by character every update
func passive_process(owner):
	pass
		
