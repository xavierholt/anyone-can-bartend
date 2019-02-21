tool extends Node2D

var w = 200
var h = 200

var stars = 0
var scene = load("res://Star.tscn")

func _draw():
	draw_rect(Rect2(0, 0, w, h), Color(1, 1, 1))
	pass

func add_star():
	var s = scene.instance()
#	var t = load("res://Decals/Star" + str(randi() % 9 + 1) + ".png")
#	s.set_texture(t)
	var x = (stars % 10) * 20 + 10 + randi() % 10
	var y = (stars / 10) * 20 + 10 + randi() % 10
	
	add_child(s)
	s.position = Vector2(x, y)
	s.rotation = randf() * 0.5 - 0.25
	stars     += 1
