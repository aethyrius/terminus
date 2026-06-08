extends Node

@export var cmd_name: String

func on_pressed() -> void:
	Globals.ui_handler.alert_message("You have unlocked the " + "\"" + cmd_name + "\"" + " command!")
	Globals.terminal.enable_cmd(cmd_name)
