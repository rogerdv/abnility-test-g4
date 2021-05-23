extends TextureRect

#inventory equipped item slots

func get_drag_data(position):
	var data={}
	data["origin_texture"] = texture
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = Vector2(64,64)
	
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 *drag_texture.rect_size
	set_drag_preview(control)
	
	return data

func can_drop_data(position, data):
	var slot:String=get_parent().name
	var idx=data["inv_index"]
	
	match slot:
		"weapon":			
			if game_data.get_item(game_instance.player.get_player().inventory[idx].get("id")).equip_slot!=base_item.SLOT_WEAPON:
				return false
		"shield":
			if game_data.get_item(game_instance.player.get_player().inventory[idx].get("id")).equip_slot!=base_item.SLOT_SHIELD:
				return false
		"head":
			if game_data.get_item(game_instance.player.get_player().inventory[idx].get("id")).equip_slot!=base_item.SLOT_HEAD:
				return false
		"armor":
			if game_data.get_item(game_instance.player.get_player().inventory[idx].get("id")).equip_slot!=base_item.SLOT_ARMOR:
				return false
	return true

func drop_data(position, data):
	texture = data["origin_texture"]
	game_instance.player.get_player().equipped[base_item.SLOT_WEAPON]=game_instance.player.get_player().inventory[data["inv_index"]].get("id")
	game_data.get_item(game_instance.player.get_player().inventory[data["inv_index"]].get("id")).equip(game_instance.player.get_player())
