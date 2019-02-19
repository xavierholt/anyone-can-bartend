tool extends Node2D

export (Color) var color = Color(0.5, 0.5, 0.5)

var fluids = {}
var solids = {}
var volume = 0

func take(pct, fluid):
	var v = fluids[fluid] * pct
	fluids[fluid] -= v
	volume -= v
	return v

func pour(target, v = 0.05):
	if volume < 0.00001: return
	var vol = min(volume, v)
	var pct = vol / volume
	for fluid in fluids:
		var x = 0
		if target.fluids.has(fluid):
			x = target.fluids[fluid]
		target.fluids[fluid] = x + take(pct, fluid)
	target.volume += vol
	target.color = target.color.linear_interpolate(color, vol / target.volume)
	target.update()
	update()
