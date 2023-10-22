extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.walking_speed *= 0.8
		body.transform = body.transform.scaled_local(Vector2(0.8, 0.8))


func _on_body_exited(body):
	if body.is_in_group("player"):
		body.walking_speed /= 0.8
		body.transform = body.transform.scaled_local(Vector2(1.0/0.8, 1.0/0.8))
