extends Node2D

var ready = true

func begin():
	if ready:
		get_node("Mover/Player").play("Trash")
		ready = false

func clean():
	var drinks = []
	for slot in get_node("Mover/Slots").get_children():
		var i = slot.get_node("Click").item()
		if i and "glass" in i: i.queue_free()

func reset():
	ready = true
