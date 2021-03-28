extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player = preload("res://scenes/player-test.tscn").instance()
var passv_ab = preload("res://tests/passive01.tres")
var act_ab = preload("res://tests/active01.tres")
var move_ab = preload("res://tests/move_test.tres")

# Called when the node enters the scene tree for the first time.
func _ready():	
	passv_ab.id="passive0"
	act_ab.id="active0"
	move_ab.id="move"
	move_ab.type=2
	var t = {"id":"passive0","value":{"level":2,"ability":passv_ab} }
	player.abilities.append(t)	
	act_ab.type=2
	t = {"id":"active0","value":{"level":1,"ability":act_ab} }
	player.abilities.append(t)
	t = {"id":"move","value":{"level":3,"ability":move_ab} }
	player.abilities.append(t)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
