@abstract extends Node2D
class_name Health

@export var owning : Node
@export var health : int
@export var max_health : int

@abstract func die()

func _ready() -> void:
	health = max_health

func take_damage(value: int) -> void:
	print("taking %d damage", value)
	health -= value
	if (health <= 0): 
		health = 0
		die()

func heal(value: int) -> void:
	health += value
	if (health > max_health): 
		health = max_health
