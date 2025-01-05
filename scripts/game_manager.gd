extends Node2D
#score
var score : float = 0

#speed on which the pipes and other elements move
const initialMoveRate : float = 250
var moveRate : float 

#sort of something to pause the game
var gameActive : bool = false

#sound effects
@export var deathSound : AudioStreamPlayer
@export var scoreSound : AudioStreamPlayer

#pipes
@export var minPipeDelay : float
@export var maxPipeDelay : float

@export var minPipeUnitDistance : float
@export var maxPipeUnitDistance : float
@export var randomYoffset : float

#particle
@export var jumpParticleScene : PackedScene

func getWorld() -> Node2D:
	var world = get_tree().root.get_node("world")
	return world

func addScore():
	score += 1
	print(score)
	scoreSound.play()
	print("move rate:" + str(moveRate))
	print("min pipe delay:" + str(minPipeDelay))
	print("max pipe delay:" + str(maxPipeDelay))
	
func die():
	score = 0
	deathSound.play()
	get_tree().reload_current_scene()
	gameActive = false

func adjustMoveRate():
	moveRate = initialMoveRate + score * 16
	
func unpauseGameIfJumpInput():
	if(Input.is_action_just_pressed("jump") and !gameActive):
		gameActive = true
		
func _process(delta: float) -> void:
	unpauseGameIfJumpInput()
	adjustMoveRate()
