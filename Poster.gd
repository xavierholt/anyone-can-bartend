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
	var x = (stars % 10) * 20 + 7 + randi() % 6
	var y = (stars / 10) * 20 + 7 + randi() % 6
	
	add_child(s)
	s.position = Vector2(x, y)
	s.rotation = randf() * 0.5 - 0.25
	stars     += 1
