extends KinematicBody2D
# Definir Coordenadas X, Y
var motion = Vector2()
# Definir direção do Piso / Chão
const floorDirection = Vector2(0,-1)

# Velocidade Maxima
const speedMax = 100
# Gravidade
const gravity = 20
# Aceleração maxima da Gravidade
const maxGravity = 200
# Força do Pulo
const powerJump = 400

# Configurar Fisica
func _physics_process(delta):
	# Configurar Gravidade
	# Limitar a Aceleração da Gravidade
	if motion.y < maxGravity:
		motion.y += gravity
	
	# Pular
	# Pular apenas em contato com o Chão
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y = - powerJump
	# Mover para Direita
	elif Input.is_action_pressed("ui_right"):
		# Animação
		# No chão
		if is_on_floor():
			$AnimationPlayer.play("walk")
		# No Ar
		else:
			# Pulando
			if motion.y < 0:
				$AnimationPlayer.play("jump")
			# Caindo
			elif motion.y > 0:
				$AnimationPlayer.play("fall")
		# Virar Sprite
		$Sprite.set_flip_h(false)
		motion.x = speedMax
	# Mover para Esquerda
	elif Input.is_action_pressed("ui_left"):
		# Animação
		# No chão
		if is_on_floor():
			$AnimationPlayer.play("walk")
		# No ar
		else:
			# Pulando
			if motion.y < 0:
				$AnimationPlayer.play("jump")
			# Caindo
			elif motion.y > 0:
				$AnimationPlayer.play("fall")
		# Virar Sprite
		$Sprite.set_flip_h(true)
		motion.x = - speedMax
	# Para movimento Horizontal
	else:
		# Animação
		# No chão
		if is_on_floor():
			$AnimationPlayer.play("idle")
		# No ar
		else:
			# Pulando
			if motion.y < 0:
				$AnimationPlayer.play("jump")
			# Caindo
			elif motion.y > 0:
				$AnimationPlayer.play("fall")
		motion.x = 0
	# Pulo interrompido
	if Input.is_action_just_released("ui_up") and motion.y < 0:
		motion.y = 0
	# Executar Movimentação
	move_and_slide(motion, floorDirection)

