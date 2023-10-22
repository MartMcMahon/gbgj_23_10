extends Node2D

var state = false

func switch():
	state = !state
	$on.visible = state
	$off.visible = !state
