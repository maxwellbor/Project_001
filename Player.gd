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
	# Executar Movimentação
	move_and_slide(motion, floorDirection)
