extends TextureRect


func get_drag_data(position):
	var ability_slot = get_parent().get_name()
	print(ability_slot)
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
	if game_data.get_ability(data.get("ability_id")).type==base_ability.PASSIVE:
		return true
	else :
		return false

func drop_data(position, data):
	texture = data["origin_texture"]
	game_instance.player.get_player().passive=data.get("ability_id")
