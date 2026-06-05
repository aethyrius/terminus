extends Node

func cmd(args) -> void:	
			
	var toggles = get_tree().get_nodes_in_group('toggles')
	print(args)
	
	if (args.size() == 0):
		for t: Toggleable in toggles:
			t.toggle()
		
	for arg in args:		
		if arg in Toggleable.e_color:
			var value = Toggleable.e_color[arg]
			
			for t: Toggleable in toggles:
				if t.tog_color == value:
					t.toggle()
