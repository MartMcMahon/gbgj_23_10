extends Node2D

const DEFAULT_ROOM_POS = Vector2(50.0, 49.0)
const ROOM_STARTING_POS: Vector2 = Vector2(1285.0, 868.0)

var roomScenes
@export var starting_room_idx = 0
var current_room_idx = starting_room_idx
var current_room_node

# Called when the node enters the scene tree for the first time.
func _ready():
	roomScenes = [load("res://room1/room_1.tscn"), load("res://room2/room_2.tscn")]# $"Room_3"]
	current_room_node = roomScenes[starting_room_idx].instantiate()
	current_room_node.position = DEFAULT_ROOM_POS
	add_child(current_room_node)
	
func goto_room(idx):
	if idx >= 3:
		idx = 0
	remove_child(current_room_node)
	current_room_node = roomScenes[idx].instantiate()
	current_room_node.position = DEFAULT_ROOM_POS
	add_child(current_room_node)
	current_room_idx = idx

func advance_room():
	goto_room(current_room_idx +1)
	$"../Player".position = ROOM_STARTING_POS
