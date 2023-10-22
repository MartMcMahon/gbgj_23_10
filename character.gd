extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	self.velocity = input_direction * SPEED

	move_and_slide()
	light_decay(delta)


func light_decay(delta):
	var scale = $CandleLight.texture_scale
	$CandleLight.texture_scale = max(scale - delta/10, 0.0)
	
	if ($CandleLight.texture_scale == 0.0):
		# start death timer
		pass
