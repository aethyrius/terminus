extends Control

@onready var label: Label = $"Text" 

func display(message: String) -> void:
	visible = true
	label.text = message
	var tween: Tween = create_tween()
	tween.tween_property(label, "visible_ratio", 1.0, 2.0).from(0.0)
	
	await tween.finished
	_finish_alert()

func _finish_alert() -> void:
	await get_tree().create_timer(2.5).timeout
	visible = false
	label.text = ""
