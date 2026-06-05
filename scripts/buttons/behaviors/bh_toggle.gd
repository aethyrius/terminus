extends Node

# Target must be the parent of this node
@onready var rb: RigidBody2D = $"..".find_child("RigidBody2D", true, false)
@onready var coll: CollisionShape2D = $"..".find_child("CollisionShape2D", true, false)

func complete() -> void:
	rb.modulate.a = 0.2
	coll.set_deferred("disabled", true)
