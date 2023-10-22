extends Area2D

signal advance_room

func _on_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("advance_room")
