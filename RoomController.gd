extends Node2D

var rooms

# Called when the node enters the scene tree for the first time.
func _ready():
	rooms = [$"Room_1", $"../Room_2", $"../Room_3"]
	print(rooms)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
