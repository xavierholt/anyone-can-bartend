var data

func _init(map = {}):
	data = map.duplicate()

func add(key, value):
	data[key] = get(key) + value

func clear():
	data.clear()

func get(key):
	if data.has(key):
		return data[key]
	return 0.0

func keys():
	return data.keys()

func set(key, value):
	data[key] = value

func sub(key, value):
	data[key] = get(key) - value

func values():
	return data.values()
