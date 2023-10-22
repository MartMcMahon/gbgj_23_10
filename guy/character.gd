extends CharacterBody2D

@export var walking_speed = 150.0
@export var candle_decay_factor: float = 5.0
@onready var _animated_sprite = $AnimatedSprite2D

var x_scale = 0.1
var is_in_bookcase_area = false
var is_in_phono_area = false
var is_in_light_area = false

signal player_action

func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	self.velocity = input_direction * walking_speed
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
	

func _input(event):
	if event.is_action_pressed("player_select"):
		if is_in_bookcase_area:
			print('collect book!')
			return
		
		if is_in_phono_area:
			$"../RoomController".current_room_node.phonograph.switch()
			print('phono!')
			return
		
		var actionables = $"../RoomController".current_room_node.actionables
		var closest_bunch = get_closest(actionables)
		print("distance to closest ", snapped(closest_bunch[1], 0.01))
		if closest_bunch[1] <= 150.0: # and is_in_light_area:
			if closest_bunch[0].switch():
				$"../".light_counter += 1
			else: 
				$"../".light_counter -= 1
			print("lights: ", $"../".light_counter)
			return

func get_closest(nodes):
	var closest_dist: float = 10000.0
	var closest_node
	for node in nodes:
		var this_dist = self.position.distance_to(node.position)
		if this_dist < closest_dist:
			closest_dist = this_dist
			closest_node = node
	return [closest_node, closest_dist]

func light_decay(delta):
	var texture_scale = $CandleLight.texture_scale
	$CandleLight.texture_scale = max(texture_scale - delta/candle_decay_factor, 0.0)
	
	if ($CandleLight.texture_scale == 0.0):
		# start death timer
		pass

