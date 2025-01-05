extends CharacterBody2D

var jumpVel : float = 300.0
@export var jumpSound : AudioStreamPlayer

func _process(delta: float) -> void:
	if(!GameManager.gameActive):
		return
	look_at(velocity/2)

func _physics_process(delta: float) -> void:
	if(!GameManager.gameActive):
		return
		
	if Input.is_action_just_pressed('jump'):
		velocity.y = -jumpVel
		jumpSound.play()
		var jumpParticle : Node2D = GameManager.jumpParticleScene.instantiate()
		jumpParticle.global_position = global_position
		GameManager.getWorld().add_child(jumpParticle)
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if (area.is_in_group("danger")):
		call_deferred("die")
	if(area.is_in_group("score")):
		GameManager.addScore()
		
func die():
	GameManager.die()
