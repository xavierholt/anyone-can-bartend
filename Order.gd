extends Button

var recipe
var remaining = 10
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

func fulfill():
	var s = get_node("/root/Bar/ServeTray")
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
	for k in drinks[0].fluids:
		print(k + ": " + str(drinks[0].fluids[k]))
	var score = recipe.score(drinks[0])
	print("Order fulfilled! :)")
	print(" - " + recipe.name + ": " + str(score) + " stars")
	drinks[0].queue_free()
	queue_free()

func tick():
	if remaining <= 0:
		#TODO: Complain!
		get_node("/root/Bar/Posters/GoldStars").add_star()
		print("Order timed out! :(")
		queue_free()
		return
	remaining -= 1
	set_text(str(remaining) + ": 1x " + recipe.name)
