extends Node2D

@export var pipeScene : PackedScene
@export var generatorTimer : Timer

func _on_timer_timeout() -> void:
	if(!GameManager.gameActive):
		return
	generatePipe()
	
func generatePipe():
	#creates pipe instance
	var pipeInstance : Node2D = pipeScene.instantiate()
	pipeInstance.global_position = global_position
	GameManager.getWorld().add_child(pipeInstance)
	#sets the timer to a random value between minDelay and maxDelay
	generatorTimer.wait_time = randf_range(GameManager.minPipeDelay, GameManager.maxPipeDelay)
	
	
