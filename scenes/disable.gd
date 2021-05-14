extends Area3D

#If the area is visible, unload it

@export var anchor_node:String		#this is where the instance will be placed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_disable_body_entered(body):
	var a=get_node(anchor_node)
	if a.get_child_count()>0:
		a.get_child(0).queue_free()
