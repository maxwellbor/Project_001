extends Area2D
func _ready():
	pass # Replace with function body.

# Ao tocar Moeda
func _on_Coin_body_entered(body):
	# Somar Moeda
	Global.coins += 1
	# Animação de Coleta
	$AnimationPlayer.play("collected")
	# Esperar Animação Terminar
	yield($AnimationPlayer, "animation_finished")
	# Destruir Objeto
	queue_free()
