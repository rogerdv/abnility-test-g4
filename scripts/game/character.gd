extends KinematicBody3D
class_name character


const STR = 0
const INT = 1
const DEX = 2
const CON = 3

@export var attrib:Array = [10,10,10,10]
var hp = [1.0, 1.0]		#0, current, 1, max
var ep = [1.0, 1.0]

#derived stats
var velocity = 2.5
var nav

var lights:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	calculate_stats()

func set_navigator(navigator):
	nav = navigator #get_node("../Navigation3D")
	$NavigationAgent3D.set_navigation(nav)	
	
func move_to(dest:Vector3):
	$NavigationAgent3D.set_target_location(dest)
	if not $NavigationAgent3D.is_target_reachable():
		print("Cant reach location")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
			
func calculate_stats():
	hp[0] = 10 * attrib[character.CON] *(attrib[character.STR]/10)
	hp[1] = hp[0]
	ep[0] = 5 * attrib[character.INT] * (attrib[character.CON] / 10)
	ep[1] = ep[0]	
