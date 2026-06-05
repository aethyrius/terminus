extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	var health = body.get_node_or_null("Health")
	if health:
		health.call_deferred("take_damage", health.max_health)
