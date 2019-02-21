extends Node2D

var filling_points

func _draw():
	var c = get_parent().color
	var v = get_parent().volume / 2
	filling_points[1] = Vector2(-18 - 2*v, -15*v)
	filling_points[2] = Vector2(+18 + 2*v, -15*v)
	draw_colored_polygon(filling_points, c)

func _ready():
	filling_points = PoolVector2Array()
	filling_points.push_back(Vector2(-18, 0))
	filling_points.push_back(Vector2(-18, 0))
	filling_points.push_back(Vector2(+18, 0))
	filling_points.push_back(Vector2(+18, 0))

func _process(delta):
	update()
