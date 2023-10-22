extends Node2D

var gameplay_scene
var game

func _ready():
	init_gameplay()

func init_gameplay():
	var gameplay_scene = load("res://gameplay.tscn")
	game = gameplay_scene.instantiate()

func start_game():
	add_child(game)

func _on_start_button_pressed():
	init_gameplay()
	start_game()

func _on_quit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
