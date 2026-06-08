extends Node

@export var color: Toggleable.e_color

func on_pressed() -> void:
	Globals.ui_handler.alert_message("You can now toggle the color " + Toggleable.e_color.keys()[color] + ".")
	var toggles = get_tree().get_nodes_in_group('toggles')
	
	for t: Toggleable in toggles:
		if (t.tog_color == color):
			t.toggleable = true
