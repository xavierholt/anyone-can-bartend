tool extends Node2D

var w = 200
var h = 200

export (int) var sideroom = 15
export (int) var headroom = 60
export (int) var columns  = 8

var stars = 0
var scene = load("res://Star.tscn")

func add_star():
	var s = scene.instance()
#	var t = load("res://Decals/Star" + str(randi() % 9 + 1) + ".png")
#	s.set_texture(t)
	var x = (stars % columns) * 20 + 10 + randi() % 10
	var y = (stars / columns) * 20 + 10 + randi() % 10
	
	add_child(s)
	s.position = Vector2(sideroom + x, headroom + y)
	s.rotation = randf() * 0.5 - 0.25
	stars     += 1
