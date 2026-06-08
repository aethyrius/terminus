extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group('player'):
		for i in range(Globals.terminal.alias_menu.alias_nodes.size()):
			if (Globals.terminal.alias_menu.alias_nodes[i].enabled == false):
				Globals.terminal.alias_menu.alias_nodes[i].enabled = true
				print("Enabled")
				queue_free()
				return
