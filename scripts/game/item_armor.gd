extends base_item
class_name item_armor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@export var protection:Array=[0,0,0,0]

func equip(owner:Node):
	print("Armor equiped")
	var attach=owner.find_node("shield")
	
	var item_mesh=mesh.instance()
	item_mesh.name=id
	
	attach.add_child(item_mesh)

func unequip(owner:Node):
	pass
	
func use(owner:Node, target:Node):
	pass
