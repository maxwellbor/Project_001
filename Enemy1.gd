extends KinematicBody2D
var motion = Vector2()
var floorDir = Vector2(0,-1)
const speed = 80
const gravity = 20
const gravityMax = 200
var hited = 0

func _physics_process(delta):
	# Chão
	if is_on_floor() and hited == 0:
		# Movimento Inicial
		if motion.x == 0:
			motion.x = speed
		# Buraco no Caminha
		# Esquerda
		if $floorLeft.is_colliding() == false:
			motion.x = speed
		# Direita
		if $floorRight.is_colliding() == false:
			motion.x = - speed
		# Parede no caminho
		# Esquerda
		if $wallLeft.is_colliding():
			motion.x = speed
		if $wallRight.is_colliding():
			motion.x = - speed
		
		# Animações
		# Esquerda
		if motion.x < 0:
			# Virar
			$Sprite.set_flip_h(false)
			# Animar
			$AnimationPlayer.play("walk")
		# Direita
		if motion.x > 0:
			# Virar
			$Sprite.set_flip_h(true)
			# Animar
			$AnimationPlayer.play("walk")
	# Ar
	else:
		# Gravidade
		if motion.y < gravityMax:
			motion.y += gravity
	
	move_and_slide(motion, floorDir)


func _on_Head_body_entered(body):
	# Parar movimentos
	hited = 1
	motion.x = 0
	# Repelir Player
	$"../../Player".motion.y = - ($"../../Player".powerJump)/2
	
	# Animação
	$AnimationPlayer.play("hited")
	# Esperar Animação
	yield($AnimationPlayer, "animation_finished")
	# Destruir Enemy
	queue_free()


func _on_Body_body_entered(body):
	# Parar Enemy1
	hited = 1
	# Repelir Enemy1
	motion.x = - motion.x
	motion.y = - speed*2
	# Repelir Player
	$"../../Player".motion.y = - $"../../Player".powerJump/2
	# Animação
	$AnimationPlayer.play("hited")
	# Esperar
	yield($AnimationPlayer, "animation_finished")
	# Subtrair Vida
	Global.lifes -= 1
	# Mover Enemy1
	hited = 0
