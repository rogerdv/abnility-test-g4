extends TextureRect

func get_drag_data(position):
	var data={}
	data["origin_texture"] = texture
	data["inv_index"]=get_parent().inv_item_index		#inventory array index
	data["item_id"]=get_parent().name
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
	texture = data["origin_texture"]


func _on_icon_gui_input(event):
	if event is InputEventScreenTouch:
		get_parent().inv_window.set_info(game_data.get_item(get_parent().name).desc)
