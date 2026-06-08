extends Control
class_name UIHandler

@onready var alert_dialog = $"AlertDialog"

func _ready() -> void:
	Globals.ui_handler = self

func alert_message(message: String):
	alert_dialog.display(message)
