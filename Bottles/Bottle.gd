tool extends "res://Vessel.gd"

export (String) var fluid = "fluid"

var source = true
var target = false

func _ready():
	fluids[fluid] = 1.0
	volume        = 1.0

func take(pct, fluid):
	return pct
