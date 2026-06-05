extends Node

func cmd(args) -> void:	
	Globals.terminal.player.gravity = -Globals.terminal.player.gravity
	Globals.terminal.player.animator.flip_v = not Globals.terminal.player.animator.flip_v
