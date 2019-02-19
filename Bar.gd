extends Node

var Recipe = load("res://Recipe.gd")

var pouring = false
var source  = null
var target  = null
var cursor  = null

var recipes = [
	Recipe.new("Negroni", {
		"gin":      3.0,
		"campari":  3.0,
		"vermouth": 3.0
	}),
	Recipe.new("Americano", {
		"campari":    3.0,
		"vermouth":   3.0,
		"soda-water": 1.0
	})
]

func _ready():
	cursor = get_node("Cursor")
	print(OS.get_screen_size())

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

func deliver(order):
	var drinks = []
	var s = get_node("ServeTray")
	for slot in s.get_children():
		var i = slot.get_node("Click").item()
		if i != null: drinks.append(i)
	if len(drinks) == 0:
		print("No drinks to deliver!")
		return
	if len(drinks) != 1:
		print("Only deliver one drink at at time!")
		return
	for k in drinks[0].fluids:
		print(k + ": " + str(drinks[0].fluids[k]))
	var score = order.recipe.score(drinks[0])
	print(order.recipe.name + ": " + str(score) + " stars")
	drinks[0].queue_free()
