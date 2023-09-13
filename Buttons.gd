extends Node

func add_button(parent:Node, text:String, pos:Vector2, dims:Vector2):
	var button1 = Button.new()
	button1.set_position(pos)
	button1.set_size(dims)
	button1.show()
	button1.text = text
	parent.add_child(button1)
#	print('BUTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTONZ')
#	print(button1)
	pass

