extends Node3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_new_pressed():
	get_tree().change_scene("res://Assets/Levels/Dungeon_01.tscn")


func _on_load_pressed():
	get_tree().change_scene("res://scenes/base_chunk.tscn")
