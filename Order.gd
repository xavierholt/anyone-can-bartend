extends Button

var recipe
var remaining = 5
var threshold = 5

func _ready():
	var bar   = get_node("/root/Bar")
	var timer = bar.get_node("Timers/OrderTimer")
	timer.connect("timeout", self, "tick")

	var recipes = bar.recipes
	recipe = recipes[randi() % len(recipes)]
	set_text(str(remaining) + ": 1x " + recipe.name)

func _pressed():
	fulfill()

func score(drink):
	var post = get_node("/root/Bar/Posters/Correctness")
	var list = recipe.map(drink)
	for k in list.data:
		if not recipe.fluids.has(k):
			post.add_fail()
			continue
		var p = abs(list.get(k) / recipe.fluids[k])
		if p < 0.1: post.add_star()
		if p > 0.6: post.add_fail()

func fulfill():
	var s = get_node("/root/Bar/ServeTray/Slots")
	var drinks = []
	for slot in s.get_children():
		var i = slot.get_node("Click").item()
		if i != null: drinks.append(i)
	if len(drinks) == 0:
		print("No drinks to deliver!")
		return
	if len(drinks) != 1:
		print("Only deliver one drink at at time!")
		return
	if remaining >= threshold:
		get_node("/root/Bar/Posters/Timeliness").add_star()
	for k in drinks[0].fluids:
		print(k + ": " + str(drinks[0].fluids[k]))
	score(drinks[0])
	drinks[0].queue_free()
	queue_free()

func tick():
	if remaining <= 0:
		#TODO: Complain!
		get_node("/root/Bar/Posters/Timeliness").add_fail()
		queue_free()
		return
	remaining -= 1
	set_text(str(remaining) + ": 1x " + recipe.name)
