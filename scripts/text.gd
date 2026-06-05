extends LineEdit

@export var terminal: Node2D
@export var alias_menu: AliasMenu

func _process(delta: float):
	var col = caret_column
	text = text.to_upper()
	caret_column = col

func _on_text_submitted(new_text: String) -> void:
	if (alias_menu.visible):
		alias_menu.visible = false
		alias_menu.register_aliases()
