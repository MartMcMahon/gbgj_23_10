extends Node

var actionables = []

# Called when the node enters the scene tree for the first time.
func _ready():
	actionables.push_back($"Wall Light")
	actionables.push_back($"Wall Light2")
	pass
