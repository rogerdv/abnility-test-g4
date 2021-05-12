extends Node


# Central repository for all game information, like list of abilities and items

var abilities = load("res://tests/abilities.tres") 
var items=load("res://tests/items.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in items.items:
		print(i.id)
	for i in abilities.abilities:
		print(i.id)
	print("Init")
	
func gd_print():
	print("Test")
	
func get_item(id:String)->base_item:
	for i in items.items:		
		if id==i.id:
			return i
	return null

func get_ability(id:String) -> base_ability:
	for i in abilities.abilities:
		if id==i.id:
			return i
	return null
