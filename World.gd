extends Node2D
func _ready():
	# Mostrar HUD
	$"/root/Hud/heart".visible = true
	$"/root/Hud/lifes".visible = true
	$"/root/Hud/coin".visible = true
	$"/root/Hud/coins".visible = true
