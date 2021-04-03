extends KinematicBody2D
var motion = Vector2()
var floorDir = Vector2(0,-1)
const speed = 80
const gravity = 20
const gravityMax = 200

func _physics_process(delta):
	# Chão
	if is_on_floor():
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
