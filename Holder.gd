tool extends Node2D

func _draw():
	draw_rect(Rect2(-25, -200, 50, 200), Color(1, 1, 1))
	draw_line(Vector2(-25, 0), Vector2(25, 0), Color(0, 0, 0), 4)
