extends Node

var actionables = []

# Called when the node enters the scene tree for the first time.
func _ready():
	actionables.push_back(get_node("Walls/table1"))	
	actionables.push_back(get_node("Walls/table2"))	
	actionables.push_back(get_node("Walls/couch"))	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
