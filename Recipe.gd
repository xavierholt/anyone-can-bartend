var name
var fluids
var solids

var Map = load("res://Map.gd")

func _init(n, f, s = {}):
	name   = n
	fluids = f
	solids = s

func map(drink):
	var list = Map.new()
	for f in fluids:
		list.set(f, fluids[f])
	for f in drink.fluids:
		list.sub(f, drink.fluids[f])
	return list

func score(drink):
	var rank = 5.0
	var list = map(drink)
	for v in list.values():
		rank -= abs(v)
	return rank