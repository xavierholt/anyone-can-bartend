extends Node2D

var timer

func _draw():
	var t = -timer.time_left
	draw_circle(Vector2(0, 0), 100, Color(1, 1, 1))
	var h = fmod(t, 60) * TAU / 60 - PI/2
	draw_line(Vector2(0, 0), Vector2(cos(h), sin(h)) * 80, Color(1, 0, 0))
	var m = (t / 60) * TAU / 12 - PI/2
	draw_line(Vector2(0, 0), Vector2(cos(m), sin(m)) * 30, Color(0, 0, 0))

func _ready():
	timer = get_node("/root/Bar/Timers/LevelTimer")

func _process(delta):
	update()
