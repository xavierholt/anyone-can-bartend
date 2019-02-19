extends Button

var recipe

func _ready():
	var recipes = get_node("/root/Bar").recipes
	recipe = recipes[randi() % len(recipes)]
	set_text("1x " + recipe.name)

func _pressed():
	get_node("/root/Bar").deliver(self)
