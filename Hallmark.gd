extends Node

var window_dims:Vector2i = Vector2i(0, 0)

func _ready():
#	var w = Window.new()
#	var wid = get_viewport_rect().size
	print('window_dims:BEFORE=', window_dims)
#	print(wid)
#	window_dims = DisplayServer.window_get_size(wid)
	print('window_dims:AFTER=', window_dims)

func rand_pos() -> Vector2:
	var x = randf() * window_dims[0]
	var y = randf() * window_dims[1]
	return Vector2(x, y)


func db_row_to_cardmaker(db_row:Dictionary):
	%Util.cprint(db_row['tw_full_text'])
	if db_row['tw_api_content']:
		%Hallmark.generate_card(self, db_row['tw_api_content'], {})
	%Util.cprint('-------')
	%Buttons.add_button(self, "Butt1", Vector2(20,20), Vector2(80,20))
	%Buttons.add_button(self, "Butt2", Vector2(120,20), Vector2(80,20))

#generate_card(self, 'foo bar baz blork', {})
func generate_card(parent, text:String, options:Dictionary):
	var card = ColorRect.new()
	card.set_position(Vector2(100, 100))
	card.set_size(Vector2(150, 300))
	card.show()
	
	var label := Label.new()
	label.text = "blorbos"
	label.set("theme_override_colors/font_color", Color.AQUA)
	label.autowrap_mode = TextServer.AUTOWRAP_WORD
	label.set_position(Vector2(150, 150))
	label.set_size(Vector2(80, 20))
	card.add_child(label)
	
	var label2 := Label.new()
	label2.text = "blorbos2"
	label2.set("theme_override_colors/font_color", Color.AQUA)
	label2.set_position(Vector2(450, 450))
	label2.autowrap_mode = TextServer.AUTOWRAP_WORD
	label2.set_size(Vector2(80, 20))
	card.add_child(label2)
	
	var te := TextEdit.new()
	te.placeholder_text = "write me daddy"
	te.set("theme_override_colors/font_color", %Util.rando_color())
	te.autowrap_mode = TextServer.AUTOWRAP_WORD
	te.set_position(Vector2(250, 250))
	te.set_size(Vector2(80, 20))
	card.add_child(te)

	var json = JSON.new()
	var t = json.parse(text)

#	print(t)
	if t:
		print('generate_card():', str(t['full_text']))

	#card.text = text
	parent.add_child(card)
	pass
