extends KinematicBody3D
class_name character

#Base Character class
#Player and NPC classes derive from this

const STR = 0
const INT = 1
const DEX = 2
const CON = 3

@export var attrib:Array = [10,10,10,10]
var hp = [1.0, 1.0]		#0, current, 1, max
var ep = [1.0, 1.0]
@export var natural_res=[0.0,0.,0.0,0.0]

#derived stats
var velocity = 2.5
var speed_mod
var nav
var bonus=[]	#bonuses
var buff=[]	#buffers


var lights:int = 0

var target		#Selected entity
var inventory = []
var abilities = []
var passive:String = "" 	#equipped passive
var equipped=["","",""]
var actions=[]	#WE can queue actions, like an ability after the current attack

# Called when the node enters the scene tree for the first time.
func _ready():
	calculate_stats()

func signed_angle_to(u, v, axis):	
	var dir = u.cross(v).dot(axis)
	var unsigned = u.angle_to(v)
	if dir > 0:
		return unsigned
	else:
		return -unsigned

func face_to(pos:Vector3):
	var a = signed_angle_to(transform.basis.z.normalized(), Vector3(pos.x, 0, pos.y).normalized(), Vector3.UP)	
	rotation = Vector3(rotation.x,a,rotation.z)
		
func set_navigator(navigator):
	nav = navigator #get_node("../Navigation3D")
	$NavigationAgent3D.set_navigation(nav)	
	
func move_to(dest:Vector3):
	pass
	#$NavigationAgent3D.set_target_location(dest)
	#if not $NavigationAgent3D.is_target_reachable():
	#	print("Cant reach location")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func play_anim(anim,speed=1.0):
	$AnimationPlayer.play(anim)
	
func calculate_stats():
	hp[0] = 10 * attrib[character.CON] *(attrib[character.STR]/10)
	hp[1] = hp[0]
	ep[0] = 5 * attrib[character.INT] * (attrib[character.CON] / 10)
	ep[1] = ep[0]	
	speed_mod= attrib[DEX]/10

func get_attrib(att:int)->int:
	var base=attrib[att]	
	for b in bonus:
		if b.get("type")==base_ability.ATTR and b.get("attribute")==att:
			#print("Found!! Value is ", b.get("value"))
			base=base+b.get("value")
			break
	
	return base

func check_actions(delta):
	
	if actions.size()>0:		
		if  actions[0].get("counter")==0: # #the action was just added			
			actions[0]["counter"]+=delta
			match actions[0].get("type"):
				"item":
					for i in range(inventory.size()):
						if inventory[i].get("id")==actions[0].get("id"):							
							game_data.get_item(actions[0].get("id")).use(actions[0].get("owner"),actions[0].get("target"))
							play_anim(game_data.get_item(actions[0].get("id")).use_anim)
				"ability":	
					play_anim(game_instance.get_ability(actions[0].get("id")).use_anim)
					game_data.get_ability(actions[0].get("id")).execute(actions[0].get("owner"),actions[0].get("target"))
					
		#in cooldown
		elif actions[0].get("counter")>0 and  actions[0].get("counter")<actions[0].get("cooldown"):		
			actions[0]["counter"]+=delta		
				
		elif actions[0].get("counter")>=actions[0].get("cooldown"):
			#the action expired, remove it			
			actions.remove(0)
				
#get the total protection against a damage type
func get_protection(prot_type)->float:
	var base:float = natural_res[prot_type]
	
	if equipped[base_item.SLOT_ARMOR]!="":
		print("I have some armor equipped "+equipped[base_item.SLOT_ARMOR])
		base+=game_data.get_item(equipped[base_item.SLOT_ARMOR]).protection[prot_type]		
	return base

func get_animator():
	return	$AnimationPlayer	
