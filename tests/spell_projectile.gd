extends Node3D

var target
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = (target.translation - translation).normalized() * (10*delta)
	translate(velocity)
	
	if translation.distance_to(target.translation)<0.5:
		print("Close to impact")
		
		queue_free()
		
