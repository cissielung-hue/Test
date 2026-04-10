extends Area3D

@export var gold_amount: int = 20

func _ready() -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if body.has_method("add_gold"):
		body.add_gold(gold_amount)

	queue_free()  # Remove chest after opening
