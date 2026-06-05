extends Node

@export var cmd_name: String

func on_pressed() -> void:
	Globals.terminal.enable_cmd(cmd_name)
