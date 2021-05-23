extends Control


# Declare member variables here. Examples:
# var a = 2
var b = load("res://ui/inv_slot.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in game_instance.player.get_player().inventory.size():
		var button = b.instance()
		button.inv_window = self
		button.inv_item_index = i
		button.name=game_instance.player.get_player().inventory[i].get("id")
		button.get_child(0).texture = game_data.get_item(game_instance.player.get_player().inventory[i].get("id")).icon
		button.get_child(1).text = str(game_instance.player.get_player().inventory[i].get("amount"))
		$MarginContainer/PanelContainer/HBoxContainer/VBoxContainer/inventory.add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_info(info:String):
	$MarginContainer/PanelContainer/HBoxContainer/VBoxContainer/info.text=info
	

func _on_close_pressed():
	get_parent().get_node("UI").restore_ui()
	queue_free()
