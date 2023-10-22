extends Node2D

var state = false

func switch():
	state = !state
	$on.visible = state
	$off.visible = !state
	return state

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.is_in_light_area = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
			body.is_in_light_area = false
