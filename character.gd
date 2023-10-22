extends CharacterBody2D

const SPEED = 150.0
@onready var _animated_sprite = $AnimatedSprite2D

var x_scale = 0.1

func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	self.velocity = input_direction * SPEED
	if (self.velocity != Vector2(0.0, 0.0)):
		_animated_sprite.play("walk")
		if (self.velocity.x < 0.0):
			_animated_sprite.scale.x = -x_scale
		else:
			_animated_sprite.scale.x = x_scale
	else:
		_animated_sprite.stop()

	move_and_slide()
	light_decay(delta)


func light_decay(delta):
	var ts = $CandleLight.texture_scale
	$CandleLight.texture_scale = max(ts - delta/100, 0.0)
	
	if ($CandleLight.texture_scale == 0.0):
		# start death timer
		pass
