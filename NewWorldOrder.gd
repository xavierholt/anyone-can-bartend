extends Node2D

func label(text):
	var l = Label.new()
	l.set_theme(load("res://Blackletter.tres"))
	l.set_text(text)
	return l

func set_recipe(r):
	var list = get_node("Frame/List")
	list.add_child(label(r.name))
	for i in r.fluids:
		var s = " - " + str(r.fluids[i]) + " cl " + i
		list.add_child(label(s))
