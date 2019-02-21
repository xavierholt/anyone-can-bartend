extends Node

var Recipe = load("res://Recipe.gd")
var Order  = load("res://Order.tscn")

var pouring = false
var source  = null
var target  = null
var cursor  = null

var recipes = [
	Recipe.new("Negroni", {
		"gin":            3.0,
		"campari":        3.0,
		"sweet vermouth": 3.0
	}),
	Recipe.new("Americano", {
		"campari":        3.0,
		"sweet vermouth": 3.0,
		"soda water":     1.0
	}),
	Recipe.new("Black Russian", {
		"vodka":  5.0,
		"kahlua": 2.0
	}),
	Recipe.new("Brave Bull", {
		"tequila": 4.5,
		"kahlua":  1.5
	}),
	Recipe.new("Godfather", {
		"scotch":   3.5,
		"amaretto": 3.5
	}),
	Recipe.new("Godmother", {
		"vodka":    3.5,
		"amaretto": 3.5
	}),
	Recipe.new("Widow's Cork", {
		"irish whisky": 4.0,
		"amaretto":     2.0
	})
]

func _ready():
	randomize()
	cursor = get_node("Cursor")
	print(OS.get_screen_size())
	
	get_node("Timers/OrderTimer").connect("timeout", self, "tick")
	get_node("Timers/LevelTimer").connect("timeout", self, "done")
	
	var i = 0
	var panel = load("res://NewWorldOrder.tscn")
	var recps = get_node("Recipes")
	for recipe in recipes:
		var x = i % 6
		var y = i / 6
		var r = panel.instance()
		r.set_recipe(recipe)
		recps.add_child(r)
		var p = Vector2(150*x + y%2*75, 20*y)
		var q = Vector2(randf() * 10, randf() * 10)
		r.position = p + q
		r.rotation = randf() * 0.3 - 0.15
		i += 1

func _physics_process(delta):
	if pouring and source:
		source.pour(target)

func click(slot):
	target = slot.item()
	if not target:
		cursor.drop(slot)
		source = null
	elif not source:
		cursor.grab(target)
		source = target
		target = null
	elif target.target:
		pouring = true
		cursor.pour()

func unclick(slot):
	pouring = false
	cursor.unpour()

func done():
	print("Level complete!")
	get_tree().quit()

func tick():
	if randf() < 0.2:
		var o = Order.instance()
		var v = get_node("MarginContainer/VBoxContainer")
		v.add_child(o)
