extends Node

@export var target: AccumulativeTarget

func on_pressed() -> void:
	target.fulfill_requirement()
