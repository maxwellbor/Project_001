extends KinematicBody2D
# Definir Coordenadas X, Y
var motion = Vector2()
# Definir direção do Piso / Chão
const floorDirection = Vector2(0,-1)

# Configurar Fisica
func _physics_process(delta):
	# Configurar Gravidade
	# Limitar a Aceleração da Gravidade
	if motion.y < 200:
		motion.y += 20
	
	# Pular
	# Pular apenas em contato com o Chão
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y = -500
	# Mover para Direita
	elif Input.is_action_pressed("ui_right"):
		motion.x = 100
	# Mover para Esquerda
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	# Para movimento Horizontal
	else:
		motion.x = 0
	
	# Executar Movimentação
	move_and_slide(motion, floorDirection)
