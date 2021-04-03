extends Panel
func _process(delta):
	# Tecla ESC
	if Input.is_action_just_pressed("ui_cancel"):
		# Se Despausado
		if get_tree().paused == false:
			# Pausar!
			get_tree().paused = true
			# Mostrar menuPaused
			visible = true
		# Se Pausado
		else:
			# Despausar
			get_tree().paused = false
			# Esconder menuPaused
			visible = false

# Botôes
# Resume
func _on_resume_pressed():
	# Despausar
	get_tree().paused = false
	# Esconder menuPaused
	visible = false

# Reset
func _on_reset_pressed():
	# Despausar
	get_tree().paused = false
	# Esconder menuPaused
	visible = false
	# Resetar Variaveis
	Global.lifes = 3
	Global.coins = 0
	# Reiniciar Scene
	get_tree().change_scene("res://World.tscn")
	# Resetar Transition
	$"../Transition".margin_left = 0
