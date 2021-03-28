extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_button(name:String, id:int):
	var b = Button.new()
	b.text = name
	$VBoxContainer.add_child(b)
	b.connect("pressed", button_pressed, [id])

func button_pressed(id):
	#print(id)
	if game_instance.player.abilities[id].get("value").get("ability").type==1: #passive ability
		if game_instance.player.passive!=game_instance.player.abilities[id].get("id"):
			game_instance.player.abilities[id].get("value").get("ability").passive_equip(game_instance.player)
		else:
			game_instance.player.passive=""	#unequip passive ability
	else :
		game_instance.player.abilities[id].get("value").get("ability").execute(game_instance.player, game_instance.player)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_lights(number:int):
	$Label.text="Lights "+str(number)
