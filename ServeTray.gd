extends Node2D

var order = null

func serve():
	order.fulfill()

func reset():
	order = null