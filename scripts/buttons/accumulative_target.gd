extends Node
class_name AccumulativeTarget

@export var requirements: int
@export var complete_behavior: Script
var curr_reqs: int = 0

func fulfill_requirement() -> void:
	curr_reqs += 1
	if (curr_reqs == requirements):
		call_behavior()
		
func call_behavior() -> void:
	print("fulfilled")
	$"Behavior".complete()
	
	
	
