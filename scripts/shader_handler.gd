extends Node2D

@onready var abberation = $CharacterBody2D/CanvasLayer/ColorRect.material

func _process(delta) -> void:
	var uv_pos = global_position / Vector2(get_viewport().size)
	abberation.set_shader_parameter('player_screen_pos', uv_pos)
