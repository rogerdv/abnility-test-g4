extends ai_logic
class_name skidle_logic

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func do_logic(manager):	
	if manager.sensor.visible_ents.size()>0:
		print("I see player")
		manager.parent.target = manager.sensor.visible_ents[0]
		manager.current = "combat"
