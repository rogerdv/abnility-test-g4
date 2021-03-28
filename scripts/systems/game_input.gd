extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode==KEY_1:
			game_instance.player.test_ab()
		elif  event.keycode==KEY_ESCAPE:
			get_tree().quit()
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
