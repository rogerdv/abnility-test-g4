extends base_ability
class_name test_ability

# Declare member variables here. Examples:
# var a = 2
@export var effect:Resource

# Called when the node enters the scene tree for the first time.
func execute(caster, target):	
	var part = effect.instance()
	part.target=target	
	caster.get_parent().add_child(part)
	var forward = caster.global_transform.basis.z	
	part.global_transform.origin = caster.global_transform.origin + forward * 1
	part.global_transform.origin.y += 1
	
	#check caster passive
	var passive_mod = 1
	if caster.passive == "passive0":
		for i in caster.abilities:
			if i.get("id")=="passive0":
				print("test passive found")
				passive_mod = i.get("value").get("level") 
	var result = target.hp[0]-(get_level(caster)*passive_mod)	
	target.hp[0]=result
	print(target.hp[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
