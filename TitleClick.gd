extends Area2D

func _input_event(viewport, event, shape):
	if event is InputEventMouseButton and event.is_pressed():
		get_node("/root/Bar").start()
		get_parent().queue_free()
