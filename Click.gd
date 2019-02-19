extends Area2D

func _input_event(viewport, event, shape):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_node("/root/Bar").click(self)
		else:
			get_node("/root/Bar").unclick(self)

func item():
	var p = get_parent()
	var n = p.get_child_count()
	var i = p.get_child(n - 1)
	if "source" in i: return i