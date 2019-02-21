extends Node2D

var item = null
var slot = null

func _ready():
	unpour()

func _process(delta):
	position = get_global_mouse_position()

func drop(slot):
	if not item: return
	get_node("Holder").remove_child(item)
	slot.get_parent().add_child(item)
	item = null

func grab(item):
	if not item: return
	var p = item.get_parent()
	if p: p.remove_child(item)
	get_node("Holder").add_child(item)
	self.item = item

func pour():
	get_node("Holder").position = Vector2(150, -150)
	get_node("Holder").rotation = 4 * PI / 3

func unpour():
	get_node("Holder").position = Vector2(32, 42)
	get_node("Holder").rotation = -0.3
