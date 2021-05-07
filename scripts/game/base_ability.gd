extends Resource
class_name base_ability

var abilities = []

# Declare member variables here. Examples:
const NORMAL=1
const PASSIVE =2

@export var type: int = 1
@export var id:String = "id"
@export var icon:Texture
@export var use_anim:String	#Use animation
@export var cooldown:float


#Bonus/buff types
const ATTR = 1	#attribute bonus/buff, always integer numbers
const OTHER=2 	#Other (attack/dodge) always a percent

func get_level(owner) ->int:
	var my_lvl = 0
	for a in owner.abilities:
		if a.get("id")==id:
			my_lvl = a.get("level")
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
		
