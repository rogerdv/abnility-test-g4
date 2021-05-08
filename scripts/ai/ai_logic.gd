extends Resource
class_name ai_logic

# AI logic block(
# Every block should derive from this and reimplement DoLogic()
# @author rogerdv


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func do_logic(manager):	
	if manager.sensor.VisibleEntities.size()>0:
		print("I see something")
		manager.parent.Inventory[0].equip(manager.parent)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
