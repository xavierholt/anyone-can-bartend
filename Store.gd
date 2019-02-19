extends Node2D

export (String) var sname

var scene

func _ready():
	scene = load("res://" + sname + ".tscn")
