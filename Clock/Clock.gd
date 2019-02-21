extends Node2D

var timer
var mhand
var shand

func _ready():
	timer = get_node("/root/Bar/Timers/LevelTimer")
	mhand = get_node("Minute Hand")
	shand = get_node("Second Hand")

func _process(delta):
	var t = -timer.time_left
	shand.rotation = fmod(t, 60) * TAU / 60
	mhand.rotation = (t / 60) * TAU / 12
