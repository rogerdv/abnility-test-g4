extends Node3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var t = {"id":"pum","amount":1}
	$"NPC-Skeleton".inventory.append(t)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
