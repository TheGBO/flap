extends Node2D

@export var componentParent : Node2D

func _process(delta: float) -> void:
	componentParent.global_position.x -= GameManager.moveRate * delta
	pass
