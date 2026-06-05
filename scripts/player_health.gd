extends Health

@export var respawn_pos : Node2D

func die() -> void:
	print("player dies")
	set_physics_process(false)
	set_process_input(false)
	
	var corpse_scn = preload("res://scenes/player_corpse.tscn")
	var corpse = corpse_scn.instantiate()
	corpse.global_transform = global_transform
	corpse.get_node("Sprite2D").flip_h = $"../AnimatedSprite2D".flip_h
	get_tree().current_scene.add_child(corpse)
	
	var vel = owning.velocity
	if (corpse is RigidBody2D):
		corpse.linear_velocity = vel
	
	owning.global_position = respawn_pos.global_position
	health = max_health
