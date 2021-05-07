extends Node


# Central repository for all game information, like list of abilities and items

var abilities = preload("res://tests/abilities.tres") 
var items=preload("res://tests/items.tres")
var ab_list = []  #Store Abilities here
var it_list = []  #Store items here

# Called when the node enters the scene tree for the first time.
func _ready():
	#Load all the ability resource files
	for ab_resource in abilities.abilities:
		print(ab_resource)
		var temp=load(ab_resource)
		#print(temp["id"])
		ab_list.append(temp)
	
	#load items
	for it_resource in items.items:
		var temp = load(it_resource)
		print(temp.id)	
		it_list.append(temp)


func get_item(id:String)->base_item:
	for i in it_list:
		if id==i.id:
			return i
	return null

func get_ability(id:String) -> base_ability:
	for i in ab_list:
		if id==i.id:
			return i
	return null
