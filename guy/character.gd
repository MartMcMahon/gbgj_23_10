extends CharacterBody2D

const SPEED = 150.0
@onready var _animated_sprite = $AnimatedSprite2D

var x_scale = 0.1
var candle_decay_factor: float = 5.0

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

	print("ok?")	
	move_and_slide()
	print("ok?")
	light_decay(delta)
	print("ok?")
	
	print(Input.get_action_strength("ui_accept"))
	if (Input.get_action_strength("ui_accept")):
		print($"../RoomController/Room_1/Actionables".actionables)



func light_decay(delta):
	var texture_scale = $CandleLight.texture_scale
	$CandleLight.texture_scale = max(texture_scale - delta/candle_decay_factor, 0.0)
	
	if ($CandleLight.texture_scale == 0.0):
		# start death timer
		pass
