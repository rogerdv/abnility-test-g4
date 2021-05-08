extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@export var current = "" 	#current state
var previous:String 
var timer:float = 0.25
var sensor 
var parent 

# Called when the node enters the scene tree for the first time.
func _ready():	
	parent = get_parent()	
	sensor = parent.get_node("Sensor") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	timer-=delta
	if timer<=0:
		update_state()
		timer = 0.25
	
func update_state():	
	print("Processing state ",get_node(current).name)
	get_node(current).update(self)
	
func add_flag(flag):
	parent.flags.append(flag)
	
func check_flag(id:String)->bool:
	for i in range(parent.flags.size()):
		if parent.flags[i]["id"]==id:
			return true
	return false
