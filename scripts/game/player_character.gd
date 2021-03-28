extends character
class_name player_character

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var abilities = []
var passive:String = "" 	#equipped passive

var default_color:Color

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	default_color=$MeshInstance3D.get_surface_material(0).albedo_color
	
func play(anim):	
	$AnimationPlayer.play(anim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if lights==0:
		var color = default_color
		color.a = 0 
		$MeshInstance3D.get_surface_material(0).albedo_color = color
	else:
		$MeshInstance3D.get_surface_material(0).albedo_color = default_color
		
	

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
				i.get("value").get("ability").passive_process(self)
