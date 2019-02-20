tool extends Node2D

func _draw():
	draw_rect(Rect2(-40, -200, 80, 200), Color(1, 1, 1))
	draw_line(Vector2(-40, 0), Vector2(40, 0), Color(0, 0, 0), 4)
