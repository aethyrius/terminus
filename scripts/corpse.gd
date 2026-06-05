extends Node

func _ready() -> void:
	await get_tree().create_timer(3.0).timeout
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1, 0), 1.5)
	tween.finished.connect(self.queue_free)
