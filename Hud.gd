extends CanvasLayer

func _process(delta):
	# Atualizar Vidas
	$lifes.text = String(Global.lifes)
	# Atualizar Moedas
	$coins.text = String(Global.coins)
	# Controlar Transition
	if $Transition.margin_left < 640:
		$Transition.margin_left += 10
