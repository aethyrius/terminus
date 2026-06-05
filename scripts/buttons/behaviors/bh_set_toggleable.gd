extends Node

@export var color: Toggleable.e_color

func on_pressed() -> void:
	var toggles = get_tree().get_nodes_in_group('toggles')
	
	for t: Toggleable in toggles:
		if (t.tog_color == color):
			t.toggleable = true
