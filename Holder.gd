tool extends Node2D

export (float) var w =  50
export (float) var h = 200

func _draw():
	draw_rect(Rect2(-w/2, -h, w, h), Color(1, 1, 1))
	draw_line(Vector2(-w/2, 0), Vector2(w/2, 0), Color(0, 0, 0), 4)
