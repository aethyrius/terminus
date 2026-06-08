extends CharacterBody2D
class_name PlayerMovement

@export var speed = 600
@export var jump_speed = -900
@export var gravity = 2200
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25

@onready var terminal = $Terminal
@onready var animator = $AnimatedSprite2D

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if (velocity.x > 0):
		animator.flip_h = false
	elif (velocity.x < 0):
		animator.flip_h = true
	
	if (!is_on_floor() and !is_on_ceiling()):
		if (animator.animation != 'falling'):
			animator.play('falling')
	elif (absf(velocity.x) >= 15):
		if animator.animation != 'walking':
			animator.play('walking')
	else:
		if (terminal.is_terminal_open):
			if (animator.animation != 'thinking'):
				animator.play('thinking')
		else:
			if animator.animation != 'default':
				animator.play('default')
	
	var dir = Input.get_axis('left', 'right')
	if (!terminal.is_terminal_open):
		if dir != 0:
			velocity.x = lerp(velocity.x, dir * speed, acceleration)
		else:
			velocity.x = lerp(velocity.x, 0.0, friction)

		if (Input.is_action_just_pressed('jump')):
			if (is_on_floor()):
				velocity.y = jump_speed
			elif (is_on_ceiling()):
				velocity.y = -jump_speed
	else:
		if (is_on_floor() or is_on_ceiling()):
			velocity.x = lerp(velocity.x, 0.0, friction)

	move_and_slide()
