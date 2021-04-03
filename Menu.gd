extends Control
func _ready():
	# Esconder HUD
	$"/root/Hud/heart".visible = false
	$"/root/Hud/lifes".visible = false
	$"/root/Hud/coin".visible = false
	$"/root/Hud/coins".visible = false


func _on_Button_pressed():
	# Carregar Fase 1
	get_tree().change_scene("res://World.tscn")
	# Resetar Transition
	$"/root/Hud/Transition".margin_left = 0
