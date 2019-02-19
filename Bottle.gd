tool extends "Vessel.gd"

export (String) var fluid = "fluid"

var outline_points
var filling_points

var source = true
var target = false

func _draw():
	draw_colored_polygon(filling_points, color)
	draw_polyline(outline_points, Color(0, 0, 0))

func _ready():
	fluids[fluid] = 1.0
	volume        = 1.0

	outline_points = PoolVector2Array()
	filling_points = PoolVector2Array()

	outline_points.push_back(4 * Vector2(-3, 0))
	outline_points.push_back(4 * Vector2(-5, -10))
	outline_points.push_back(4 * Vector2(-1, -12))
	outline_points.push_back(4 * Vector2(-1, -18))
	outline_points.push_back(4 * Vector2(+1, -18))
	outline_points.push_back(4 * Vector2(+1, -12))
	outline_points.push_back(4 * Vector2(+5, -10))
	outline_points.push_back(4 * Vector2(+3, 0))
	outline_points.push_back(4 * Vector2(-3, 0))

	filling_points.push_back(4 * Vector2(-3, 0))
	filling_points.push_back(4 * Vector2(-5, -10))
	filling_points.push_back(4 * Vector2(+5, -10))
	filling_points.push_back(4 * Vector2(+3, 0))

func take(pct, fluid):
	return pct
