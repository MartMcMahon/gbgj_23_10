extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("it's the player!")
		$wall_layer_sprite.visible = true
		


func _on_body_exited(body):
	$wall_layer_sprite.visible = false
