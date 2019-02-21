tool extends Node2D

export (int) var sideroom = 15
export (int) var headroom = 60
export (int) var columns  = 8

var decals = 0
var star   = load("res://Star.tscn")
var okay   = load("res://Okay.tscn")
var fail   = load("res://Fail.tscn")

func add(decal):
	var x = (decals % columns) * 20 + 10 + randi() % 10
	var y = (decals / columns) * 20 + 10 + randi() % 10
	
	add_child(decal)
	decal.position = Vector2(sideroom + x, headroom + y)
	decal.rotation = randf() * 0.5 - 0.25
	decals += 1

func add_fail():
	add(fail.instance())

func add_okay():
	add(okay.instance())

func add_star():
	add(star.instance())
#	var t = load("res://Decals/Star" + str(randi() % 9 + 1) + ".png")
#	s.set_texture(t)
