extends KinematicBody2D
# Definir Coordenadas X, Y
var motion = Vector2()
# Definir direção do Piso / Chão
const floorDirection = Vector2(0,-1)

# Velocidade Maxima
const speedMax = 300
# Gravidade
const gravity = 100
# Aceleração maxima da Gravidade
const maxGravity = 200
# Força do Pulo
const powerJump = 200

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
		motion.x = speedMax
	# Mover para Esquerda
	elif Input.is_action_pressed("ui_left"):
		motion.x = - speedMax
	# Para movimento Horizontal
	else:
		motion.x = 0
	
	# Executar Movimentação
	move_and_slide(motion, floorDirection)
