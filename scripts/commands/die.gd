extends Node

func cmd(args) -> void:	
	var health = Globals.terminal.player.get_node_or_null("Health")
	if health:
		health.die()
