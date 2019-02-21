extends PanelContainer

var recipe
var remaining = 60
var threshold = 30

func _ready():
	var bar   = get_node("/root/Bar")
	var timer = bar.get_node("Timers/OrderTimer")
	timer.connect("timeout", self, "tick")
	
	var label = get_node("Label")
	label.connect("pressed", self, "dispatch")

	var recipes = bar.recipes
	recipe = recipes[randi() % len(recipes)]
	tick() # To set text...

func score(drink):
	var post = get_node("/root/Bar/Posters/Correctness")
	var list = recipe.map(drink)
	var count = 0
	var fails = 0
	for k in list.data:
		count += 1
		if not recipe.fluids.has(k):
			post.add_fail()
			fails += 1
			continue
		var p = abs(list.get(k) / recipe.fluids[k])
		if p < 0.1:
			post.add_star()
		elif p > 0.6:
			post.add_fail()
			fails += 1
		else:
			post.add_okay()
	return float(count - fails) / count

func dispatch():
	var tray = get_node("/root/Bar/ServeTray")
	if tray.order == null:
		tray.get_node("Player").play("Serve")
		tray.order = self

func fulfill():
	var slots = get_node("/root/Bar/ServeTray/Slots").get_children()
	var drinks = []
	for slot in slots:
		var i = slot.get_node("Click").item()
		if i and "glass" in i: drinks.append(i)
	if len(drinks) == 0:
		print("No drinks to deliver!")
		return
	if len(drinks) != 1:
		print("Only deliver one drink at at time!")
		return
	for k in drinks[0].fluids:
		print(k + ": " + str(drinks[0].fluids[k]))
	if score(drinks[0]) > 0.5:
		var post = get_node("/root/Bar/Posters/Timeliness")
		if remaining >= threshold:
			post.add_star()
		else:
			post.add_okay()
	drinks[0].queue_free()
	queue_free()

func tick():
	if remaining <= 0:
		#TODO: Complain!
		get_node("/root/Bar/Posters/Timeliness").add_fail()
		queue_free()
		return
	var label = get_node("Label")
	label.set_text("0:" + str(remaining) + " - " + recipe.name)
	remaining -= 1
