extends Node
class_name ai_state

# AI states
# @author rogerdv

@export var logic_blocks:Array
var blocks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(logic_blocks.size()):
		blocks.append(load(logic_blocks[i]))

func update(manager):	
	print("Processing state")
	for i in range(blocks.size()):
		blocks[i].do_logic(manager)	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
