extends base_ability
class_name pow_me


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func execute(caster, target):
	var lvl = caster.get_ability_level(id)
	var power = { "type":ATTR,"attribute":character.STR ,"value":lvl,"duration":3+lvl}
	caster.bonus.append(power)
	
