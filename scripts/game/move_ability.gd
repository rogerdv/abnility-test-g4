extends base_ability
class_name move_ability


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func execute(caster, target):
	var forward = caster.get_global_transform().basis.z
	print("Forward ",forward)
	caster.translate(Vector3(0,0,10)+forward)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
