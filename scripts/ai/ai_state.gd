extends Node
class_name ai_state

# AI states
# @author rogerdv

@export var logic_blocks:Array[Resource]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func update(manager):		
	for i in range(logic_blocks.size()):
		logic_blocks[i].do_logic(manager)	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
