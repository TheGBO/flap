extends Node2D

@export var upperPipeUnit : Node2D
@export var lowerPipeUnit : Node2D

func _ready() -> void:
	var dist = randf_range(GameManager.minPipeUnitDistance, GameManager.maxPipeUnitDistance)
	setPipeDistance(dist)
	global_position.y = randf_range(-GameManager.randomYoffset, GameManager.randomYoffset)
	
func setPipeDistance(dist : float):
	upperPipeUnit.global_position.y = -dist
	lowerPipeUnit.global_position.y = dist

func _process(delta: float) -> void:
	if(!GameManager.gameActive):
		return
	if(global_position.x < -1000):
		queue_free()
	
