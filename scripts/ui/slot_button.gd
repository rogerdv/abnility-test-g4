extends TextureRect


func get_drag_data(position):
	var ability_slot = get_parent().get_name()
	print(ability_slot)
	var data={}
	data["origin_texture"] = texture
	data["ability_id"]=ability_slot
	
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
	return true

func drop_data(position, data):
	pass
