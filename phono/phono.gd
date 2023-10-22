extends Node2D

@export var audio: AudioStreamWAV
var paused_pos = 0

func _ready():
	$AudioStreamPlayer2D.stream = audio
	$AudioStreamPlayer2D.play(9)
	

func _on_phopo_area_body_entered(body):
	if body.is_in_group("player"):
		body.is_in_phono_area = true


func _on_phopo_area_body_exited(body):
	if body.is_in_group("player"):
		body.is_in_phono_area = false

func switch():
	if $AudioStreamPlayer2D.playing:
		paused_pos = $AudioStreamPlayer2D.get_playback_position()
		$AudioStreamPlayer2D.stop()
	else:
		$AudioStreamPlayer2D.play(paused_pos)
