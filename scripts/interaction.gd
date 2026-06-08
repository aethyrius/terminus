extends Area2D

var interacts: Array[Interactable]

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("interact")):
		call_interact()

func _on_area_entered(area: Area2D) -> void:
	interacts.append(area)
	print(interacts)
	
func _on_area_exited(area: Area2D) -> void:
	interacts.erase(area)
	print(interacts)
	
func call_interact() -> void:
	if (interacts.is_empty()): return
	interacts[0].interact()
	interacts.erase(interacts[0])
