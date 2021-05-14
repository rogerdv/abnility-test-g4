extends Area3D

@export var anchor_node:String
@export var scene:String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_enable_body_entered(body):
	var a=get_node(anchor_node)
	if a.get_child_count()==0:
		var chunk = load(scene).instance()
		a.add_child(chunk)
