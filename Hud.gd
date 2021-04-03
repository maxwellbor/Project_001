extends CanvasLayer
func _process(delta):
	# Atualizar Vidas
	$lifes.text = String(Global.lifes)
	# Atualizar Moedas
	$coins.text = String(Global.coins)
	
