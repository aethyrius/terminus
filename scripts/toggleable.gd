extends RigidBody2D
class_name Toggleable

enum e_color {
	NONE = 0,
	RED = 1,
	R = 1,
	GREEN = 2,
	G = 2,
	BLUE = 3,
	B = 3
}

@export var toggled = false;
@export var toggleable = true
@export var tog_color : e_color

@onready var sprite = $CollisionShape2D/Sprite2D
@onready var coll = $CollisionShape2D

func _ready():
	_init_toggle()

func _init_toggle() -> void:
	toggled = !toggled
	
	if (toggled):
		modulate.a = 0.2
		coll.disabled = true
	else:
		modulate.a = 1
		coll.disabled = false
		
func toggle() -> void:
	if (!toggleable): return
	_init_toggle()
