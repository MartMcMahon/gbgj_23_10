extends Node2D

const STATE_MENU = 0
const STATE_GAMEPLAY = 1
const STATE_LOSE = 2
const STATE_WIN = 3
const STATE_PAUSE = 4

@export var game_state = STATE_GAMEPLAY
var light_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

