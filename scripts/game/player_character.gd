extends character
class_name player_character

# Declare member variables here. Examples:
var xp:int = 0
var level:int=1

var default_color:Color

var equip_abilities=["","","",""]

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	#default_color=$MeshInstance3D.get_surface_material(0).albedo_color
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_actions(delta)
	if lights==0:
		var color = default_color
		color.a = 0 
		#$MeshInstance3D.get_surface_material(0).albedo_color = color
	#else:
		
		#$MeshInstance3D.get_surface_material(0).albedo_color = default_color
			

func test_ab():
	abilities[1].get("value").get("ability").execute(self, self)

func _on_Timer_timeout():
	#regen hp, energy, etc
	hp[0] += attrib[character.CON]/100
	if hp[0]>hp[1]:
		hp[0]=hp[1]
	#check the passive
	if passive != "":
		for i in abilities:
			if i.get("id")==passive:
				game_instance.get_ability(i.get("id")).passive_process(self)
	
	#check bonus and power ups
	var to_remove=[]
		
	for b in range(bonus.size()):
		if bonus[b].get("duration")>0:	#-1 is eternal bonus
			bonus[b]["duration"]-=1
		if bonus[b].get("duration")==0:
			print("Bonus done")
			to_remove.append(b)		
			
	#clear expired bonuses
	for expired in range(to_remove.size()):
		bonus.remove(to_remove[expired])

func get_ability_level(id:String)->int:
	for i in abilities:
		if i.get("id")==id:			
			return i.get("level")
	return 0
	
