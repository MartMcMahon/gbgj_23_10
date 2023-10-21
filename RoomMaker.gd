extends Node

const RoomPrefab := preload("res://room.tscn")

func _ready():
	for y in range(1,3):
		for x in range(1,4):
			var room = RoomPrefab.instantiate()
			room.position.y = y * 150;
			room.position.x = x * 150;
			add_child(room)
