extends Node3D

var LEFT:bool=false
var RIGHT:bool=false
var FORWARD:bool=false
var BACK:bool=false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(game_instance.player)
	game_instance.player.name = "player"
	game_instance.player.translation = Vector3(0,0,0)
	#game_instance.player.rotation=Vector3(0,-1,0)
	
	#game_instance.player.passive = "passive0"
	for i in game_instance.player.abilities.size():
		#print(i)
		$UI.add_button(game_instance.player.abilities[i].get("id"),i)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_A:
			LEFT = true
			RIGHT=false
		elif event.keycode == KEY_D:
			LEFT = false
			RIGHT = true
		if event.keycode==KEY_W:
			FORWARD=true
			BACK=false
		elif event.keycode==KEY_S:
			FORWARD=false
			BACK=true
	elif  event is InputEventKey and not event.pressed:
		if event.keycode == KEY_A:
			LEFT = false
		elif event.keycode == KEY_D:			
			RIGHT = false
		elif event.keycode == KEY_W:			
			FORWARD = false
		elif event.keycode == KEY_S:			
			BACK = false
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI.update_lights(game_instance.player.lights)
	if LEFT:
		game_instance.player.translate(Vector3(-1,0,0)*delta)
	if RIGHT:
		game_instance.player.translate(Vector3(1,0,0)*delta)
	if FORWARD:
		game_instance.player.translate(Vector3(0,0,-1)*delta)
	if BACK:
		game_instance.player.translate(Vector3(0,0,1)*delta)
