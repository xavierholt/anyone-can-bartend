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
	})
]

func _ready():
	cursor = get_node("Cursor")
	print(OS.get_screen_size())
	
	get_node("Timers/OrderTimer").connect("timeout", self, "tick")
	get_node("Timers/LevelTimer").connect("timeout", self, "done")

func _physics_process(delta):
	if pouring: source.pour(target)

func click(slot):
	target = slot.item()
	if not target:
		cursor.remove_child(source)
		slot.get_parent().add_child(source)
		source = null
	elif not source:
		slot.get_parent().remove_child(target)
		cursor.add_child(target)
		source = target
		target = null
	elif target.target:
		print("Pouring...")
		pouring = true

func unclick(slot):
	pouring = false

func done():
	print("Level complete!")
	get_tree().quit()

func tick():
	if randf() < 0.2:
		print("Making an order...")
		var o = Order.instance()
		var v = get_node("MarginContainer/VBoxContainer")
		v.add_child(o)
