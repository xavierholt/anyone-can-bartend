tool extends Node2D

func _draw():
	draw_rect(Rect2(-20, -80, 40, 80), Color(1, 1, 1))
	draw_line(Vector2(-20, 0), Vector2(20, 0), Color(0, 0, 0), 4)
