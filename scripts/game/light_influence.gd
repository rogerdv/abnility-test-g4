extends Area3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area3D_body_entered(body):
	body.lights+=1
	



func _on_Area3D_body_exited(body):
	body.lights-=1
