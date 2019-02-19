extends Area2D

func _input_event(viewport, event, shape):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var bar = get_node("/root/Bar")
			if bar.source == null:
				var new = get_parent().scene.instance()
				bar.get_node("Cursor").add_child(new)
				bar.source = new
