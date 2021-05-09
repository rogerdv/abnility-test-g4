extends character
class_name npc_character

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var base_xp:int = 5
var flags = []


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp[0]<=0:		
		queue_free()
		
	check_actions(delta)


func _on_Timer_timeout():
	#regen hp, energy, etc
	hp[0] += attrib[character.CON]/100
	if hp[0]>hp[1]:
		hp[0]=hp[1]
