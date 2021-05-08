extends Area3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var visible_ents = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Something entered visible area

func _on_Sensor_body_entered(body):
	visible_ents.append(body)


func _on_Sensor_body_exited(body):
	for i in range(visible_ents.size()):
		if visible_ents[i].name == body.name:
			visible_ents.remove(i)
			break
