extends Node3D

var LEFT:bool=false
var RIGHT:bool=false
var FORWARD:bool=false
var BACK:bool=false
var joystick
var ROTATE:int=0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(game_instance.player)
	game_instance.player.name = "player"
	game_instance.player.translation = Vector3(0,0,0)
	joystick = $UI.get_joystick()
	#game_instance.player.rotation=Vector3(0,-1,0)
	
	#game_instance.player.passive = "passive0"
	for i in game_instance.player.get_player().abilities.size():
		#print(i)
		$UI.add_button(game_instance.player.get_player().abilities[i].get("id"),i)
	
	for i in game_instance.player.get_player().inventory.size():
		print(i)
		$UI.add_item_button(game_instance.player.get_player().inventory[i].get("id"),i)	
	#game_instance.player.get_player().target = $npc
	# Put some stuff in the NPC
	var t = {"id":"shield","amount":1}
	$npc.inventory.append(t)
	$npc.equipped[base_item.SLOT_ARMOR]="shield"
	

func _input(event):
	if event is InputEventScreenTouch:
		var from = get_node("player").get_camera().project_ray_origin(event.position)
		
		var to = from + get_node("player").get_camera().project_ray_normal(event.position)*400
		var space_state = get_world_3d().direct_space_state
		var result = space_state.intersect_ray(from, to, [], 1)
		if result.size()>0:
			var tn:String=result.get("collider").name			
			#print("Collided with something "+tn)
			if tn.begins_with("npc"):
				#print("Collided with some npc ")
				game_instance.player.get_player().target=result.get("collider")
				game_instance.player.face_to(Vector2(result.get("collider").translation.x,result.get("collider").translation.z))
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI.update_lights(game_instance.player.get_player().lights)
	
	game_instance.player.move(joystick.get_value().normalized(),delta)
	#game_instance.player.move(joystick.get_value().normalized(), delta)
	
