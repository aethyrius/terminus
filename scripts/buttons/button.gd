extends Area2D

@export var pressed_texture : Texture
@onready var sprite = $Sprite2D

var is_pressed: bool

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if (!is_pressed):
		if body.is_in_group('player'):
			call_behavior()
			sprite.texture = pressed_texture
			is_pressed = true

func call_behavior() -> void:
	$"Behavior".on_pressed()
	print("Pressed button!")


func _on_interaction_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
