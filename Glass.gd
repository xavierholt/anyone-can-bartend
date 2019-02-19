tool extends "res://Vessel.gd"

var outline_points
var filling_points

var source = true
var target = true

func _draw():
	var v = volume / 10.0
	filling_points[1] = 4 * Vector2(-2 - 2*v, -15*v)
	filling_points[2] = 4 * Vector2(+2 + 2*v, -15*v)
	draw_colored_polygon(filling_points, color)
	draw_polyline(outline_points, Color(0, 0, 0))

func _ready():
	outline_points = PoolVector2Array()
	filling_points = PoolVector2Array()
	
	outline_points.push_back(4 * Vector2(-2, 0))
	outline_points.push_back(4 * Vector2(-4, -15))
	outline_points.push_back(4 * Vector2(+4, -15))
	outline_points.push_back(4 * Vector2(+2, 0))
	outline_points.push_back(4 * Vector2(-2, 0))
	
	filling_points.push_back(4 * Vector2(-2, 0))
	filling_points.push_back(4 * Vector2(-3, -7.5))
	filling_points.push_back(4 * Vector2(+3, -7.5))
	filling_points.push_back(4 * Vector2(+2, 0))
