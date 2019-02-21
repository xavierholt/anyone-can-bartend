extends Area2D

export (String) var sname

var scene

func _ready():
	scene = load("res://" + sname + ".tscn")

func _input_event(viewport, event, shape):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var bar = get_node("/root/Bar")
			if bar.source == null:
				var new = scene.instance()
				bar.cursor.grab(new)
				bar.source = new
