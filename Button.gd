extends Button


func _on_Button_pressed():
	#get_tree().change_scene("res://World.tscn")
	if get_tree().paused == false:
		get_tree().paused = true
	else:
		get_tree().paused = false
